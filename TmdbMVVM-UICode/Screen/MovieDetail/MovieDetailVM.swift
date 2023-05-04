//
//  MovieDetailVM.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import RxSwift
import app_framework
import domain

class MovieDetailVM: BaseVM {

    private let getMovieDetailsUseCase: GetMovieDetailsUseCase?
    private let disposeBag = DisposeBag()

    var movieId = -1
    var movieDetailsDomain: MovieDetailsDomain?

    let titleMovie = Box("")
    let urlImage = Box("")
    let descMovie = Box("")

    init(getMovieDetailsUseCase: GetMovieDetailsUseCase?) {
        self.getMovieDetailsUseCase = getMovieDetailsUseCase
    }

    func fetchMovieDetail(movieId: Int) {
        guard getMovieDetailsUseCase != nil else {
            self.errorMessage.value = "error dependency"
            return
        }

        isShowDialogLoading.value = true

        getMovieDetailsUseCase?.call(movieId: movieId)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] response in
                self?.isShowDialogLoading.value = false

                self?.movieDetailsDomain = response

                self?.titleMovie.value = response.title
                self?.urlImage.value = response.imageUrl
                self?.descMovie.value = response.overview
            }, onError: { [weak self] error in
                self?.isShowDialogLoading.value = false

                self?.errorMessage.value = "error: \(error.localizedDescription)"
            }).disposed(by: disposeBag)
    }
}
