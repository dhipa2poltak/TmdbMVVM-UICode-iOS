//
//  GetMovieDetailsUseCase.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation
import RxSwift

public protocol GetMovieDetailsUseCase {
    func call(movieId: Int) -> Observable<MovieDetailsModel>
}
