//
//  MovieDetailView.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import UIKit
import app_framework

class MovieDetailView: ProgrammaticView {

    let lblTitleMovie: UILabel = {
        let vw = UILabel()
        vw.font = .systemFont(ofSize: 20, weight: .bold)
        vw.textAlignment = .center
        vw.numberOfLines = 0

        return vw
    }()

    let ivMovie = UIImageView()

    let lblDesc: UILabel = {
        let vw = UILabel()
        vw.textAlignment = .left
        vw.numberOfLines = 0

        return vw
    }()

    let btnShowReview: UIButton = {
        let vw = UIButton()
        vw.setTitle(NSLocalizedString("key_show_review", comment: ""), for: .normal)
        vw.setTitleColor(.systemBlue, for: .normal)

        return vw
    }()

    let btnShowTrailer: UIButton = {
        let vw = UIButton()
        vw.setTitle(NSLocalizedString("key_show_trailer", comment: ""), for: .normal)
        vw.setTitleColor(.systemBlue, for: .normal)

        return vw
    }()

    override func configure() {
        addConstrainedSubViews(lblTitleMovie, ivMovie, lblDesc, btnShowReview, btnShowTrailer)
    }

    override func constrain() {
        NSLayoutConstraint.activate([
            lblTitleMovie.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            //lblTitleMovie.centerXAnchor.constraint(equalTo: centerXAnchor),
            lblTitleMovie.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            lblTitleMovie.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            ivMovie.topAnchor.constraint(equalTo: lblTitleMovie.bottomAnchor, constant: 20),
            ivMovie.widthAnchor.constraint(equalToConstant: 200),
            ivMovie.heightAnchor.constraint(equalToConstant: 300),
            ivMovie.centerXAnchor.constraint(equalTo: centerXAnchor),
            lblDesc.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            lblDesc.topAnchor.constraint(equalTo: ivMovie.bottomAnchor, constant: 20),
            lblDesc.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            btnShowReview.topAnchor.constraint(greaterThanOrEqualTo: lblDesc.bottomAnchor, constant: 20),
            btnShowReview.centerXAnchor.constraint(equalTo: centerXAnchor),
            btnShowTrailer.topAnchor.constraint(equalTo: btnShowReview.bottomAnchor, constant: 20),
            btnShowTrailer.topAnchor.constraint(greaterThanOrEqualTo: lblDesc.bottomAnchor, constant: 20),
            btnShowTrailer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            btnShowTrailer.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
