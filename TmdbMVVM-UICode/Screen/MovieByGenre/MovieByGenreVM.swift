//
//  MovieByGenreVM.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import RxSwift

class MovieByGenreVM: BaseVM {

    private let getMovieByGenreUseCase: GetMovieByGenreUseCase?
    private let disposeBag = DisposeBag()

    var movies: [MovieEntity] = []
    let movieData: Box<Bool?> = Box(false)

    var genreId = -1
    var genreName = ""
    var page = 1

    init(getMovieByGenreUseCase: GetMovieByGenreUseCase?) {
        self.getMovieByGenreUseCase = getMovieByGenreUseCase
    }

    func fetchMovieGenre(genreId: String, page: Int) {
        isShowDialogLoading.value = true

        getMovieByGenreUseCase?.call(genreId: genreId, page: page)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] response in
                self?.isShowDialogLoading.value = false

                let movies = response.results
                if movies.count > 0 {
                    for movie in movies {
                        self?.movies.append(movie)
                        self?.movieData.value = true
                    }

                    self?.page = page
                }
            }, onError: { [weak self] error in
                self?.isShowDialogLoading.value = false

                self?.toastMessage.value = "error: \(error.localizedDescription)"
            }).disposed(by: disposeBag)
    }
}
