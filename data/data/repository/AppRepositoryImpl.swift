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

    public func fetchMovieGenre() -> Observable<GenreModel> {
        return appDataSource.fetchMovieGenre()
            .map { (response) -> GenreModel in
                response.toDomain()
            }
    }

    public func fetchMovieByGenre(genreId: String, page: Int) -> Observable<DiscoverMovieByGenreModel> {
        return appDataSource.fetchMovieByGenre(genreId: genreId, page: page)
            .map { (response) -> DiscoverMovieByGenreModel in
                response.toDomain()
            }
    }

    public func fetchMovieDetail(movieId: Int) -> Observable<MovieDetailsModel> {
        return appDataSource.fetchMovieDetail(movieId: movieId)
            .map { (response) -> MovieDetailsModel in
                response.toDomain()
            }
    }

    public func fetchMovieReviews(movieId: Int, page: Int) -> Observable<ReviewModel> {
        return appDataSource.fetchMovieReviews(movieId: movieId, page: page)
            .map { (response) -> ReviewModel in
                response.toDomain()
            }
    }

    public func fetchMovieTrailer(movieId: Int) -> Observable<TrailerModel> {
        return appDataSource.fetchMovieTrailer(movieId: movieId)
            .map { (response) -> TrailerModel in
                response.toDomain()
            }
    }
}
