//
//  GetMovieDetailsUseCaseImpl.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation
import RxSwift

public struct GetMovieDetailsUseCaseImpl: GetMovieDetailsUseCase {

    let appRepository: AppRepository

    public init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }

    public func call(movieId: Int) -> Observable<MovieDetailsModel> {
        return appRepository.fetchMovieDetail(movieId: movieId)
    }
}
