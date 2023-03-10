//
//  MovieDetailVM.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import RxSwift

class MovieDetailVM: BaseVM {

    private let apiClient: ApiClient?
    private let disposeBag = DisposeBag()

    var movieId = -1
    var movieDetailsResponse: MovieDetailsResponse?

    let titleMovie = Box("")
    let urlImage = Box("")
    let descMovie = Box("")

    init(apiClient: ApiClient?) {
        self.apiClient = apiClient
    }

    func fetchMovieDetail(movieId: Int) {
        isShowDialogLoading.value = true

        apiClient?.fetchMovieDetail(movieId: movieId)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] response in
                self?.isShowDialogLoading.value = false

                self?.movieDetailsResponse = response

                self?.titleMovie.value = response.title ?? ""
                self?.urlImage.value = BuildConfiguration.shared.IMAGE_URL_BASE_PATH + (response.posterPath ?? "")
                self?.descMovie.value = response.overview ?? ""
            }, onError: { [weak self] error in
                self?.isShowDialogLoading.value = false

                self?.toastMessage.value = "error: \(error.localizedDescription)"
            }).disposed(by: disposeBag)
    }
}
