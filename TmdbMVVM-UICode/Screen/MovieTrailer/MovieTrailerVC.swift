//
//  MovieTrailerVC.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import SVProgressHUD
import UIKit
import YouTubePlayer

class MovieTrailerVC: BaseVC, YouTubePlayerDelegate {

    let vw = MovieTrailerView()

    let viewModel = MovieTrailerVM()

    override func loadView() {
        super.loadView()

        view = vw
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupObserver()
        vw.youtubePlayer.delegate = self
    }

    override func viewDidAppear(_: Bool) {
        super.setupNavBar()

        viewModel.fetchMovieTrailer(movieId: viewModel.movieId)
    }

    private func setupObserver() {
        viewModel.isShowDialogLoading.bind { value in
            if value {
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

        viewModel.movieKey.bind { [weak self] value in
            if !value.isEmpty {
                self?.vw.youtubePlayer.loadVideoID(value)
            }

        }
    }

    func playerReady(_ videoPlayer: YouTubePlayerView) {
        vw.youtubePlayer.play()
    }
}
