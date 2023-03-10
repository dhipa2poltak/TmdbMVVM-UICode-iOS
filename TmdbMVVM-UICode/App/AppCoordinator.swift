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

        self.container.register(MovieByGenreVM.self) { (resolver, genreId: Int, genreName: String) in
            let vm = MovieByGenreVM(apiClient: resolver.resolve(ApiClient.self))
            vm.genreId = genreId
            vm.genreName = genreName

            return vm
        }

        self.container.register(MovieDetailVM.self) { (resolver, movieId: Int) in
            let vm = MovieDetailVM(apiClient: resolver.resolve(ApiClient.self))
            vm.movieId = movieId

            return vm
        }

        self.container.register(MovieReviewVM.self) { (resolver, movieId: Int, movieTitle: String) in
            let vm = MovieReviewVM(apiClient: resolver.resolve(ApiClient.self))
            vm.movieId = movieId
            vm.movieTitle = movieTitle

            return vm
        }

        self.container.register(MovieTrailerVM.self) { (resolver, movieId: Int) in
            let vm = MovieTrailerVM(apiClient: resolver.resolve(ApiClient.self))
            vm.movieId = movieId

            return vm
        }
    }

    func start() {
        let vc = GenreVC()
        let viewModel = container.resolve(GenreVM.self)
        vc.viewModel = viewModel
        vc.coordinator = container.resolve(AppCoordinator.self)

        navigationController.pushViewController(vc, animated: false)
    }

    func showMovieByGenre(genreId: Int, genreName: String) {
        let vc = MovieByGenreVC()
        let viewModel = container.resolve(MovieByGenreVM.self, arguments: genreId, genreName)
        vc.viewModel = viewModel
        vc.coordinator = container.resolve(AppCoordinator.self)

        navigationController.pushViewController(vc, animated: true)
    }

    func showMovieDetail(movieId: Int) {
        let vc = MovieDetailVC()
        let viewModel = container.resolve(MovieDetailVM.self, argument: movieId)
        vc.viewModel = viewModel
        vc.coordinator = container.resolve(AppCoordinator.self)

        navigationController.pushViewController(vc, animated: true)
    }

    func showMovieReview(movieId: Int, movieTitle: String) {
        let vc = MovieReviewVC()
        let viewModel = container.resolve(MovieReviewVM.self, arguments: movieId, movieTitle)
        vc.viewModel = viewModel

        navigationController.pushViewController(vc, animated: true)
    }

    func showMovieTrailer(movieId: Int) {
        let vc = MovieTrailerVC()
        let viewModel = container.resolve(MovieTrailerVM.self, argument: movieId)
        vc.viewModel = viewModel

        navigationController.pushViewController(vc, animated: true)
    }
}
