//
//  GetMovieByGenreUseCaseImpl.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation
import RxSwift

struct GetMovieByGenreUseCaseImpl: GetMovieByGenreUseCase {

    let appRepository: AppRepository

    init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }

    func call(genreId: String, page: Int) -> Observable<DiscoverMovieByGenreDomain> {
        return appRepository.fetchMovieByGenre(genreId: genreId, page: page)
    }
}
