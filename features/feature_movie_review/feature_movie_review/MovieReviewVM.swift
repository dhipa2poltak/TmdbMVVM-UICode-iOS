//
//  MovieReviewVM.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import RxSwift
import app_framework
import domain

public class MovieReviewVM: BaseVM {

    private let getMovieReviewUseCase: GetMovieReviewUseCase?
    private let disposeBag = DisposeBag()

    var reviews: [ReviewEntity] = []
    let reviewData: Box<Bool?> = Box(false)

    public var movieId = -1
    public var movieTitle = ""
    var page = 1

    public init(getMovieReviewUseCase: GetMovieReviewUseCase?) {
        self.getMovieReviewUseCase = getMovieReviewUseCase
    }

    func fetchMovieReviews(movieId: Int, page: Int) {
        guard getMovieReviewUseCase != nil else {
            self.errorMessage.value = "error dependency"
            return
        }

        isShowDialogLoading.value = true

        getMovieReviewUseCase?.call(movieId: movieId, page: page)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] response in
                self?.isShowDialogLoading.value = false

                let reviews = response.results
                if reviews.count > 0 {
                    for review in reviews {
                        self?.reviews.append(review)
                        self?.reviewData.value = true
                    }

                    self?.page = page
                }
            }, onError: { [weak self] error in
                self?.isShowDialogLoading.value = false

                self?.errorMessage.value = "error: \(error.localizedDescription)"
            }).disposed(by: disposeBag)
    }
}
