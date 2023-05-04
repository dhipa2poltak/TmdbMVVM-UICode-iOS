//
//  GetMovieByGenreUseCase.swift
//  TmdbMVVM-UICode
//
//  Created by user on 24/04/23.
//

import Foundation
import RxSwift

public protocol GetMovieByGenreUseCase {
    func call(genreId: String, page: Int) -> Observable<DiscoverMovieByGenreDomain>
}
