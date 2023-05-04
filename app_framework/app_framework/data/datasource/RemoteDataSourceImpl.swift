//
//  RemoteDataSourceImpl.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation
import RxSwift
import domain
import data

public class RemoteDataSourceImpl: AppDataSource {

    let apiClient: ApiClient

    public init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    public func fetchMovieGenre() -> Observable<GenreResponse> {
        return apiClient.fetchMovieGenre()
    }

    public func fetchMovieByGenre(genreId: String, page: Int) -> Observable<DiscoverMovieByGenreResponse> {
        return apiClient.fetchMovieByGenre(genreId: genreId, page: page)
    }

    public func fetchMovieDetail(movieId: Int) -> Observable<MovieDetailsResponse> {
        return apiClient.fetchMovieDetail(movieId: movieId)
    }

    public func fetchMovieReviews(movieId: Int, page: Int) -> Observable<ReviewResponse> {
        return apiClient.fetchMovieReviews(movieId: movieId, page: page)
    }

    public func fetchMovieTrailer(movieId: Int) -> Observable<TrailerResponse> {
        return apiClient.fetchMovieTrailer(movieId: movieId)
    }
}
