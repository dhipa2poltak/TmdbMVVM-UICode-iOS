//
//  GetMovieByGenreUseCaseImpl.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation
import RxSwift

public struct GetMovieByGenreUseCaseImpl: GetMovieByGenreUseCase {

    let appRepository: AppRepository

    public init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }

    public func call(genreId: String, page: Int) -> Observable<DiscoverMovieByGenreModel> {
        return appRepository.fetchMovieByGenre(genreId: genreId, page: page)
    }
}
