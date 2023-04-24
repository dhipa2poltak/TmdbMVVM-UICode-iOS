//
//  GenreVM.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import RxSwift

class GenreVM: BaseVM {

    private let getMovieGenreUseCase: GetMovieGenreUseCase?
    private let disposeBag = DisposeBag()

    var genres: [GenreEntity]?
    let genreData: Box<Bool?> = Box(false)

    init(getMovieGenreUseCase: GetMovieGenreUseCase?) {
        self.getMovieGenreUseCase = getMovieGenreUseCase
    }
    
    func loadData() {
        fetchMovieGenre()
    }

    func fetchMovieGenre() {
        isShowDialogLoading.value = true

        getMovieGenreUseCase?.call()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] response in
                self?.isShowDialogLoading.value = false

                let genres = response.genres
                self?.genres = genres
                self?.genreData.value = true

            }, onError: { [weak self ] error in
                self?.isShowDialogLoading.value = false

                self?.toastMessage.value = "error: \(error.localizedDescription)"
            }).disposed(by: disposeBag)
    }
}
