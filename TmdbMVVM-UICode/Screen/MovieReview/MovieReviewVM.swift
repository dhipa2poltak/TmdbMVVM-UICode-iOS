//
//  MovieReviewVM.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import RxSwift

class MovieReviewVM: BaseVM {

    private let disposeBag = DisposeBag()

    var reviews: [Review] = []
    let reviewData: Box<Bool?> = Box(false)

    var movieId = -1
    var movieTitle = ""
    var page = 1

    func fetchMovieReviews(movieId: Int, page: Int) {
        isShowDialogLoading.value = true

        ApiClient.fetchMovieReviews(movieId: movieId, page: page)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] response in
                self?.isShowDialogLoading.value = false

                if let reviews = response.results {
                    if reviews.count > 0 {
                        for review in reviews {
                            self?.reviews.append(review)
                            self?.reviewData.value = true
                        }

                        self?.page = page
                    }
                }
            }, onError: { [weak self] error in
                self?.isShowDialogLoading.value = false

                self?.toastMessage.value = "error: \(error.localizedDescription)"
            }).disposed(by: disposeBag)
    }
}
