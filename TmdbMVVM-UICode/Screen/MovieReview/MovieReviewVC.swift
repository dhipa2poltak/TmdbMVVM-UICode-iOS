//
//  MovieReviewVC.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import SVProgressHUD
import UIKit

class MovieReviewVC: BaseVC {

    let vw = MovieReviewView()

    let viewModel = MovieReviewVM()

    private let nbName = "ReviewTVC"
    private let cellId = "ReviewTVC"

    override func loadView() {
        super.loadView()

        view = vw
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        vw.lblTitleMovie.text = viewModel.movieTitle

        setupObserver()

        vw.tableVw.delegate = self
        vw.tableVw.dataSource = self

        vw.tableVw.register(ReviewTVC.self, forCellReuseIdentifier: cellId)

        vw.tableVw.reloadData()
    }

    override func viewDidAppear(_: Bool) {
        super.setupNavBar()

        viewModel.fetchMovieReviews(movieId: viewModel.movieId, page: viewModel.page)
    }

    private func setupObserver() {
        viewModel.isShowDialogLoading.bind { [weak self] value in
            if value && self?.viewModel.reviews.isEmpty ?? true {
                SVProgressHUD.show()
            } else {
                SVProgressHUD.dismiss()
            }
        }

        viewModel.toastMessage.bind { [weak self] value in
            if !value.isEmpty {
                self?.showToast(message: value, font: .systemFont(ofSize: 12.0))
                self?.viewModel.toastMessage.value = ""
            }
        }

        viewModel.reviewData.bind { [weak self] value in
            if value != nil {
                self?.vw.tableVw.reloadData()
                self?.viewModel.reviewData.value = nil
            }
        }
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity _: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)

        if distance < 200 {
            viewModel.fetchMovieReviews(movieId: viewModel.movieId, page: viewModel.page + 1)
        }
    }
}

extension MovieReviewVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.reviews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ReviewTVC

        let review = viewModel.reviews[indexPath.row]

        cell.bindData(review: review)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
