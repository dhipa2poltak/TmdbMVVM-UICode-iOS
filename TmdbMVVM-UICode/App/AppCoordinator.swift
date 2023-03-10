//
//  AppCoordinator.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Swinject
import UIKit

class AppCoordinator: Coordinator {
    private let container = Container()

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        registerDependencies()
    }

    private func registerDependencies() {
        self.container.register(AppCoordinator.self) { _ in
            self
        }.inObjectScope(.container)

        self.container.register(ApiClient.self) { _ in
            ApiClient()
        }.inObjectScope(.container)

        self.container.register(GenreVM.self) { resolver in
            GenreVM(apiClient: resolver.resolve(ApiClient.self))
        }

        self.container.register(MovieByGenreVM.self) { resolver in
            MovieByGenreVM(apiClient: resolver.resolve(ApiClient.self))
        }

        self.container.register(MovieDetailVM.self) { resolver in
            MovieDetailVM(apiClient: resolver.resolve(ApiClient.self))
        }

        self.container.register(MovieReviewVM.self) { resolver in
            MovieReviewVM(apiClient: resolver.resolve(ApiClient.self))
        }

        self.container.register(MovieTrailerVM.self) { resolver in
            MovieTrailerVM(apiClient: resolver.resolve(ApiClient.self))
        }

        self.container.register(GenreVC.self) { _ in
            GenreVC()
        }

        self.container.register(MovieByGenreVC.self) { _ in
            MovieByGenreVC()
        }

        self.container.register(MovieDetailVC.self) { _ in
            MovieDetailVC()
        }

        self.container.register(MovieReviewVC.self) { _ in
            MovieReviewVC()
        }

        self.container.register(MovieTrailerVC.self) { _ in
            MovieTrailerVC()
        }
    }

    func start() {
        let vc = container.resolve(GenreVC.self)
        let viewModel = container.resolve(GenreVM.self)
        vc?.viewModel = viewModel
        vc?.coordinator = container.resolve(AppCoordinator.self)

        if let vc = vc {
            navigationController.pushViewController(vc, animated: false)
        }
    }

    func showMovieByGenre(genreId: Int, genreName: String) {
        let vc = container.resolve(MovieByGenreVC.self)
        let viewModel = container.resolve(MovieByGenreVM.self)
        viewModel?.genreId = genreId
        viewModel?.genreName = genreName
        vc?.viewModel = viewModel
        vc?.coordinator = container.resolve(AppCoordinator.self)

        if let vc = vc {
            navigationController.pushViewController(vc, animated: true)
        }
    }

    func showMovieDetail(movieId: Int) {
        let vc = container.resolve(MovieDetailVC.self)
        let viewModel = container.resolve(MovieDetailVM.self)
        viewModel?.movieId = movieId
        vc?.viewModel = viewModel
        vc?.coordinator = container.resolve(AppCoordinator.self)

        if let vc = vc {
            navigationController.pushViewController(vc, animated: true)
        }
    }

    func showMovieReview(movieId: Int, movieTitle: String) {
        let vc = container.resolve(MovieReviewVC.self)
        let viewModel = container.resolve(MovieReviewVM.self)
        viewModel?.movieId = movieId
        viewModel?.movieTitle = movieTitle
        vc?.viewModel = viewModel

        if let vc = vc {
            navigationController.pushViewController(vc, animated: true)
        }
    }

    func showMovieTrailer(movieId: Int) {
        let vc = container.resolve(MovieTrailerVC.self)
        let viewModel = container.resolve(MovieTrailerVM.self)
        viewModel?.movieId = movieId
        vc?.viewModel = viewModel

        if let vc = vc {
            navigationController.pushViewController(vc, animated: true)
        }
    }
}
