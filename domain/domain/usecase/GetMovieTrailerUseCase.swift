//
//  GetMovieTrailerUseCase.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation
import RxSwift

public protocol GetMovieTrailerUseCase {
    func call(movieId: Int) -> Observable<TrailerModel>
}
