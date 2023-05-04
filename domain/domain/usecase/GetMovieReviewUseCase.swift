//
//  GetMovieReviewUseCase.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation
import RxSwift

public protocol GetMovieReviewUseCase {
    func call(movieId: Int, page: Int) -> Observable<ReviewDomain>
}
