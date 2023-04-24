//
//  GetMovieGenreUseCase.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation
import RxSwift

protocol GetMovieGenreUseCase {
    func call() -> Observable<GenreDomain>
}
