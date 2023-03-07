//
//  AppCoordinator.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = GenreVC()
        vc.coordinator = self

        navigationController.pushViewController(vc, animated: false)
    }

    func showMovieByGenre(genreId: Int, genreName: String) {
        let vc = MovieByGenreVC()
        vc.viewModel.genreId = genreId
        vc.viewModel.genreName = genreName
        vc.coordinator = self

        navigationController.pushViewController(vc, animated: true)
    }

    func showMovieDetail(movieId: Int) {
        let vc = MovieDetailVC()
        vc.viewModel.movieId = movieId
        vc.coordinator = self

        navigationController.pushViewController(vc, animated: true)
    }

    func showMovieReview(movieId: Int, movieTitle: String) {
        let vc = MovieReviewVC()
        vc.viewModel.movieId = movieId
        vc.viewModel.movieTitle = movieTitle

        navigationController.pushViewController(vc, animated: true)
    }

    func showMovieTrailer(movieId: Int) {
        let vc = MovieTrailerVC()
        vc.viewModel.movieId = movieId

        navigationController.pushViewController(vc, animated: true)
    }
}
