//
//  GetMovieGenreUseCaseImpl.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation
import RxSwift

public struct GetMovieGenreUseCaseImpl: GetMovieGenreUseCase {

    let appRepository: AppRepository

    public init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }

    public func call() -> Observable<GenreModel> {
        return appRepository.fetchMovieGenre()
    }
}
