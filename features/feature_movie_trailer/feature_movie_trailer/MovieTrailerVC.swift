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
import app_framework

public class MovieTrailerVC: BaseVC<MovieTrailerVM>, YouTubePlayerDelegate {

    let vw = MovieTrailerView()

    public override func loadView() {
        super.loadView()

        view = vw
        view.backgroundColor = .white
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        super.setupNavBar()

        setupObserver()
        vw.youtubePlayer.delegate = self

        if let viewModel = viewModel {
            viewModel.fetchMovieTrailer(movieId: viewModel.movieId)
        }
    }

    public override func setupObserver() {
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

    public func playerReady(_ videoPlayer: YouTubePlayerView) {
        vw.youtubePlayer.play()
    }
}
