//
//  AppRepositoryImpl.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation
import RxSwift
import domain

public class AppRepositoryImpl: AppRepository {

    let appDataSource: AppDataSource

    public init(appDataSource: AppDataSource) {
        self.appDataSource = appDataSource
    }

    public func fetchMovieGenre() -> Observable<GenreDomain> {
        return appDataSource.fetchMovieGenre()
            .map { (response) -> GenreDomain in
                response.toDomain()
            }
    }

    public func fetchMovieByGenre(genreId: String, page: Int) -> Observable<DiscoverMovieByGenreDomain> {
        return appDataSource.fetchMovieByGenre(genreId: genreId, page: page)
            .map { (response) -> DiscoverMovieByGenreDomain in
                response.toDomain()
            }
    }

    public func fetchMovieDetail(movieId: Int) -> Observable<MovieDetailsDomain> {
        return appDataSource.fetchMovieDetail(movieId: movieId)
            .map { (response) -> MovieDetailsDomain in
                response.toDomain()
            }
    }

    public func fetchMovieReviews(movieId: Int, page: Int) -> Observable<ReviewDomain> {
        return appDataSource.fetchMovieReviews(movieId: movieId, page: page)
            .map { (response) -> ReviewDomain in
                response.toDomain()
            }
    }

    public func fetchMovieTrailer(movieId: Int) -> Observable<TrailerDomain> {
        return appDataSource.fetchMovieTrailer(movieId: movieId)
            .map { (response) -> TrailerDomain in
                response.toDomain()
            }
    }
}
