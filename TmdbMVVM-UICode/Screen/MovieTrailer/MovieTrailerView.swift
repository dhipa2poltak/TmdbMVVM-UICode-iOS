//
//  MovieTrailerView.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import UIKit
import YouTubePlayer

class MovieTrailerView: ProgrammaticView {

    let youtubePlayer = YouTubePlayerView()

    override func configure() {

    }

    override func constrain() {
        addConstrainedSubViews(youtubePlayer)

        NSLayoutConstraint.activate([
            youtubePlayer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            youtubePlayer.leadingAnchor.constraint(equalTo: leadingAnchor),
            youtubePlayer.trailingAnchor.constraint(equalTo: trailingAnchor),
            youtubePlayer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
