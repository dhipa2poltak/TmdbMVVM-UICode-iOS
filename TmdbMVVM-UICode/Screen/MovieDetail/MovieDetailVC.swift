//
//  MovieDetailVC.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import Kingfisher
import SVProgressHUD
import UIKit

class MovieDetailVC: BaseVC {

    let scrollView = UIScrollView()
    let vw = MovieDetailView()

    var viewModel: MovieDetailVM?
    weak var coordinator: AppCoordinator?

    override func loadView() {
        super.loadView()

        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(vw)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        vw.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            vw.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            vw.topAnchor.constraint(equalTo: scrollView.topAnchor),
            vw.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            vw.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            vw.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            vw.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupObserver()

        vw.btnShowReview.addTarget(self, action: #selector(onClickShowReview(_:)), for: .touchUpInside)
        vw.btnShowTrailer.addTarget(self, action: #selector(onClickShowTrailer(_:)), for: .touchUpInside)
    }

    override func viewDidAppear(_: Bool) {
        super.setupNavBar()

        if let viewModel = viewModel {
            viewModel.fetchMovieDetail(movieId: viewModel.movieId)
        }
    }


    private func setupObserver() {
        viewModel?.isShowDialogLoading.bind { value in
            if value {
                SVProgressHUD.show()
            } else {
                SVProgressHUD.dismiss()
            }
        }

        viewModel?.toastMessage.bind { [weak self] value in
            if !value.isEmpty {
                self?.showToast(message: value, font: .systemFont(ofSize: 12.0))
                self?.viewModel?.toastMessage.value = ""
            }
        }

        viewModel?.titleMovie.bind { [weak self] value in
            self?.vw.lblTitleMovie.text = value
        }

        viewModel?.urlImage.bind { [weak self] value in
            self?.vw.ivMovie.kf.setImage(with: URL(string: value))
        }

        viewModel?.descMovie.bind { [weak self] value in
            self?.vw.lblDesc.text = value
        }
    }

    @IBAction func onClickShowReview(_ sender: UIButton) {
        if let viewModel = viewModel {
            let movieId = viewModel.movieId
            let movieTitle = viewModel.movieDetailsDomain?.title ?? "unknown"

            coordinator?.showMovieReview(movieId: movieId, movieTitle: movieTitle)
        }
    }

    @IBAction func onClickShowTrailer(_ sender: UIButton) {
        if let viewModel = viewModel {
            let movieId = viewModel.movieId

            coordinator?.showMovieTrailer(movieId: movieId)
        }
    }
}
