//
//  MovieDetailView.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import UIKit

class MovieDetailView: ProgrammaticView {

    let lblTitleMovie = UILabel()
    let ivMovie = UIImageView()
    let lblDesc = UILabel()
    let btnShowReview = UIButton()
    let btnShowTrailer = UIButton()

    override func configure() {
        lblTitleMovie.font = .systemFont(ofSize: 20, weight: .bold)
        lblDesc.numberOfLines = 0

        btnShowReview.setTitle(NSLocalizedString("key_show_review", comment: ""), for: .normal)
        btnShowReview.setTitleColor(.systemBlue, for: .normal)
        btnShowTrailer.setTitle(NSLocalizedString("key_show_trailer", comment: ""), for: .normal)
        btnShowTrailer.setTitleColor(.systemBlue, for: .normal)
    }

    override func constrain() {
        addConstrainedSubViews(lblTitleMovie, ivMovie, lblDesc, btnShowReview, btnShowTrailer)

        NSLayoutConstraint.activate([
            lblTitleMovie.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            lblTitleMovie.centerXAnchor.constraint(equalTo: centerXAnchor),
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
