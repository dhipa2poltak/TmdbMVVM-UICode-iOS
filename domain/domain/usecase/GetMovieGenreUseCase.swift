//
//  GetMovieGenreUseCase.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation
import RxSwift

public protocol GetMovieGenreUseCase {
    func call() -> Observable<GenreModel>
}
