//
//  GetMovieGenreUseCaseImpl.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation
import RxSwift

struct GetMovieGenreUseCaseImpl: GetMovieGenreUseCase {

    let appRepository: AppRepository

    init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }

    func call() -> Observable<GenreDomain> {
        return appRepository.fetchMovieGenre()
    }
}
