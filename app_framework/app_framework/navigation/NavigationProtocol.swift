//
//  AppCoordinator.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import UIKit
import data
import domain

public protocol NavigationProtocol {

    func showMovieByGenre(genreId: Int, genreName: String)

    func showMovieDetail(movieId: Int)

    func showMovieReview(movieId: Int, movieTitle: String)

    func showMovieTrailer(movieId: Int)
}
