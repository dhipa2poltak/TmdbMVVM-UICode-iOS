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
import data
import domain

public class ApiClient {

    public init() {}

    func fetchMovieGenre() -> Observable<GenreResponse> {
        request(Router.fetchMovieGenre)
    }

    func fetchMovieByGenre(genreId: String, page: Int) -> Observable<DiscoverMovieByGenreResponse> {
        request(Router.fetchMovieByGenre(genreId: genreId, page: page))
    }

    func fetchMovieDetail(movieId: Int) -> Observable<MovieDetailsResponse> {
        request(Router.fetchMovieDetail(movieId: movieId))
    }

    func fetchMovieReviews(movieId: Int, page: Int) -> Observable<ReviewResponse> {
        request(Router.fetchMovieReviews(movieId: movieId, page: page))
    }

    func fetchMovieTrailer(movieId: Int) -> Observable<TrailerResponse> {
        request(Router.fetchMovieTrailer(movieId: movieId))
    }

    private func request<T: Codable>(_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        return Observable<T>.create { observer in

            let request = AF.request(urlConvertible)
                .validate()
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
                        if let data = response.data {
                            let value = String(data: data, encoding: String.Encoding.utf8)
                            let json = JSON(value ?? "")

                            var errorResponse: ErrorResponse? = nil

                            do {
                                let rawString = json.rawString(.utf8) ?? ""
                                errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: Data(rawString.utf8))
                            } catch {
                            }

                            if (errorResponse != nil) {
                                observer.onError(AppError.networkError(message: errorResponse?.statusMessage ?? "error"))
                            } else {
                                observer.onError(error)
                            }
                        } else {
                            observer.onError(error)
                        }
                    }
                }

            return Disposables.create {
                request.cancel()
            }
        }
    }
}
