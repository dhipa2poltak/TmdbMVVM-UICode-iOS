//
//  GetMovieTrailerUseCaseImpl.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation
import RxSwift

struct GetMovieTrailerUseCaseImpl: GetMovieTrailerUseCase {

    let appRepository: AppRepository

    init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }

    func call(movieId: Int) -> Observable<TrailerDomain> {
        return appRepository.fetchMovieTrailer(movieId: movieId)
    }
}
