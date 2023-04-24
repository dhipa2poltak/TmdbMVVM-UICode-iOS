//
//  MovieTrailerVM.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import RxSwift

class MovieTrailerVM: BaseVM {

    private let getMovieTrailerUseCase: GetMovieTrailerUseCase?
    private let disposeBag = DisposeBag()

    var movieId = -1
    let movieKey = Box("")

    init(getMovieTrailerUseCase: GetMovieTrailerUseCase?) {
        self.getMovieTrailerUseCase = getMovieTrailerUseCase
    }

    func fetchMovieTrailer(movieId: Int) {
        isShowDialogLoading.value = true

        getMovieTrailerUseCase?.call(movieId: movieId)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] response in
                self?.isShowDialogLoading.value = false

                let trailers = response.results
                for trailer in trailers {
                    if trailer.site.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == "youtube" {
                        self?.movieKey.value = trailer.key
                        break
                    }
                }
            }, onError: { [weak self] error in
                self?.isShowDialogLoading.value = false

                self?.toastMessage.value = "error: \(error.localizedDescription)"
            }).disposed(by: disposeBag)
    }
}
