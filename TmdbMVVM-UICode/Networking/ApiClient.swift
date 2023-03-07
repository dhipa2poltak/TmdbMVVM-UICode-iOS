//
//  ApiClient.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Alamofire
import Foundation
import RxSwift
import SwiftyJSON

class ApiClient {

    static func fetchMovieGenre() -> Observable<GenreResponse> {
        request(Router.fetchMovieGenre)
    }

    static func fetchMovieByGenre(genreId: String, page: Int) -> Observable<DiscoverMovieByGenreResponse> {
        request(Router.fetchMovieByGenre(genreId: genreId, page: page))
    }

    static func fetchMovieDetail(movieId: Int) -> Observable<MovieDetailsResponse> {
        request(Router.fetchMovieDetail(movieId: movieId))
    }

    static func fetchMovieReviews(movieId: Int, page: Int) -> Observable<ReviewResponse> {
        request(Router.fetchMovieReviews(movieId: movieId, page: page))
    }

    static func fetchMovieTrailer(movieId: Int) -> Observable<TrailerResponse> {
        request(Router.fetchMovieTrailer(movieId: movieId))
    }

    private static func request<T: Codable>(_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        return Observable<T>.create { observer in

            let request = AF.request(urlConvertible)
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        do {
                            let json = JSON(value)
                            let data = try json.rawData(options: .prettyPrinted)
                            let objResponse: T = try JSONDecoder().decode(T.self, from: data)

                            observer.onNext(objResponse)
                            observer.onCompleted()
                        } catch {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        observer.onError(error)
                    }
                }

            return Disposables.create {
                request.cancel()
            }
        }
    }
}
