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
    private let apiClient = ApiClient()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = GenreVC()
        let viewModel = GenreVM(apiClient: apiClient)
        vc.viewModel = viewModel
        vc.coordinator = self

        navigationController.pushViewController(vc, animated: false)
    }

    func showMovieByGenre(genreId: Int, genreName: String) {
        let vc = MovieByGenreVC()
        let viewModel = MovieByGenreVM(apiClient: apiClient)
        viewModel.genreId = genreId
        viewModel.genreName = genreName
        vc.viewModel = viewModel
        vc.coordinator = self

        navigationController.pushViewController(vc, animated: true)
    }

    func showMovieDetail(movieId: Int) {
        let vc = MovieDetailVC()
        let viewModel = MovieDetailVM(apiClient: apiClient)
        viewModel.movieId = movieId
        vc.viewModel = viewModel
        vc.coordinator = self

        navigationController.pushViewController(vc, animated: true)
    }

    func showMovieReview(movieId: Int, movieTitle: String) {
        let vc = MovieReviewVC()
        let viewModel = MovieReviewVM(apiClient: apiClient)
        viewModel.movieId = movieId
        viewModel.movieTitle = movieTitle
        vc.viewModel = viewModel

        navigationController.pushViewController(vc, animated: true)
    }

    func showMovieTrailer(movieId: Int) {
        let vc = MovieTrailerVC()
        let viewModel = MovieTrailerVM(apiClient: apiClient)
        viewModel.movieId = movieId
        vc.viewModel = viewModel

        navigationController.pushViewController(vc, animated: true)
    }
}
