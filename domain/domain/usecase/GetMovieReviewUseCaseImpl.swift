//
//  GetMovieReviewUseCaseImpl.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation
import RxSwift

public struct GetMovieReviewUseCaseImpl: GetMovieReviewUseCase {

    let appRepository: AppRepository

    public init(appRepository: AppRepository) {
        self.appRepository = appRepository
    }

    public func call(movieId: Int, page: Int) -> Observable<ReviewDomain> {
        return appRepository.fetchMovieReviews(movieId: movieId, page: page)
    }
}
