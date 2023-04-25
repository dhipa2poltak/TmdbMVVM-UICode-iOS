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

class MovieTrailerVC: BaseVC<MovieTrailerVM>, YouTubePlayerDelegate {

    let vw = MovieTrailerView()

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

        if let viewModel = viewModel {
            viewModel.fetchMovieTrailer(movieId: viewModel.movieId)
        }
    }

    override func setupObserver() {
        super.setupObserver()

        viewModel?.isShowDialogLoading.bind { value in
            if value {
                SVProgressHUD.show()
            } else {
                SVProgressHUD.dismiss()
            }
        }

        viewModel?.movieKey.bind { [weak self] value in
            if !value.isEmpty {
                self?.vw.youtubePlayer.loadVideoID(value)
            }

        }
    }

    func playerReady(_ videoPlayer: YouTubePlayerView) {
        vw.youtubePlayer.play()
    }
}
