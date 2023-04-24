//
//  Router.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation

import Alamofire
import Foundation
import SwiftyJSON

enum Router: URLRequestConvertible {
    case fetchMovieGenre
    case fetchMovieByGenre(genreId: String, page: Int)
    case fetchMovieDetail(movieId: Int)
    case fetchMovieReviews(movieId: Int, page: Int)
    case fetchMovieTrailer(movieId: Int)

    public func asURLRequest() throws -> URLRequest {
        let url = URL(string: "\(BuildConfiguration.shared.API_BASE_URL)\(path)")

        if let theUrl = url {
            var urlRequest = URLRequest(url: theUrl)
            urlRequest.httpMethod = method.rawValue
            if method == .post {
                do {
                    urlRequest.httpBody = try JSON(param).rawData(options: .prettyPrinted)
                } catch {
                    print("httpBody failed!")
                }
            }
            let encodedURLRequest = try URLEncoding.default.encode(urlRequest, with: nil)

            return encodedURLRequest
        }

        throw NSError()
    }

    var method: HTTPMethod {
        switch self {
        case .fetchMovieGenre, .fetchMovieByGenre, .fetchMovieDetail, .fetchMovieReviews, .fetchMovieTrailer:
            return .get
        }
    }

    var path: String {
        switch self {
        case .fetchMovieGenre: return "3/genre/movie/list?api_key=\(BuildConfiguration.shared.API_KEY)"
        case let .fetchMovieByGenre(genreId: genreId, page: page):
            return "3/discover/movie?api_key=\(BuildConfiguration.shared.API_KEY)&with_genres=\(genreId)&page=\(page)"
        case let .fetchMovieDetail(movieId: movieId):
            return "3/movie/\(movieId)?api_key=\(BuildConfiguration.shared.API_KEY)&language=en-US"
        case let .fetchMovieReviews(movieId: movieId, page: page):
            return "3/movie/\(movieId)/reviews?api_key=\(BuildConfiguration.shared.API_KEY)&page=\(page)&language=en-US"
        case let .fetchMovieTrailer(movieId: movieId):
            return "3/movie/\(movieId)/videos?api_key=\(BuildConfiguration.shared.API_KEY)&language=en-US"
        }
    }

    var param: Parameters {
        let p = Parameters()

        switch self {
        default:
            break
        }

        return p
    }
}
