//
//  AppCoordinator.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Swinject
import UIKit
import app_framework
import data
import domain

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

        if let apiClient = container.resolve(ApiClient.self) {
            self.container.register(AppDataSource.self) { _ in
                return RemoteDataSourceImpl(apiClient: apiClient)
            }.inObjectScope(.container)
        }

        if let appDataSource = container.resolve(AppDataSource.self) {
            self.container.register(AppRepository.self) { _ in
                return AppRepositoryImpl(appDataSource: appDataSource)
            }.inObjectScope(.container)
        }

        if let appRepository = container.resolve(AppRepository.self) {
            self.container.register(GetMovieGenreUseCase.self) { _ in
                return GetMovieGenreUseCaseImpl(appRepository: appRepository)
            }
        }

        if let appRepository = container.resolve(AppRepository.self) {
            self.container.register(GetMovieByGenreUseCase.self) { _ in
                return GetMovieByGenreUseCaseImpl(appRepository: appRepository)
            }
        }

        if let appRepository = container.resolve(AppRepository.self) {
            self.container.register(GetMovieDetailsUseCase.self) { _ in
                return GetMovieDetailsUseCaseImpl(appRepository: appRepository)
            }
        }

        if let appRepository = container.resolve(AppRepository.self) {
            self.container.register(GetMovieReviewUseCase.self) { _ in
                return GetMovieReviewUseCaseImpl(appRepository: appRepository)
            }
        }

        if let appRepository = container.resolve(AppRepository.self) {
            self.container.register(GetMovieTrailerUseCase.self) { _ in
                return GetMovieTrailerUseCaseImpl(appRepository: appRepository)
            }
        }

        self.container.register(GenreVM.self) { resolver in
            GenreVM(getMovieGenreUseCase: resolver.resolve(GetMovieGenreUseCase.self))
        }

        self.container.register(MovieByGenreVM.self) { (resolver, genreId: Int, genreName: String) in
            let vm = MovieByGenreVM(getMovieByGenreUseCase: resolver.resolve(GetMovieByGenreUseCase.self))
            vm.genreId = genreId
            vm.genreName = genreName

            return vm
        }

        self.container.register(MovieDetailVM.self) { (resolver, movieId: Int) in
            let vm = MovieDetailVM(getMovieDetailsUseCase: resolver.resolve(GetMovieDetailsUseCase.self))
            vm.movieId = movieId

            return vm
        }

        self.container.register(MovieReviewVM.self) { (resolver, movieId: Int, movieTitle: String) in
            let vm = MovieReviewVM(getMovieReviewUseCase: resolver.resolve(GetMovieReviewUseCase.self))
            vm.movieId = movieId
            vm.movieTitle = movieTitle

            return vm
        }

        self.container.register(MovieTrailerVM.self) { (resolver, movieId: Int) in
            let vm = MovieTrailerVM(getMovieTrailerUseCase: resolver.resolve(GetMovieTrailerUseCase.self))
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
