//
//  MovieReviewView.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import UIKit

class MovieReviewView: ProgrammaticView {

    let lblTitleMovie = UILabel()
    let lblTitleReview = UILabel()
    let tableVw = UITableView()
    let lblNoReview = UILabel()

    override func configure() {
        backgroundColor = .white

        lblTitleMovie.font = .systemFont(ofSize: 20, weight: .bold)
        lblTitleReview.text = NSLocalizedString("key_review", comment: "")
        lblTitleReview.font = .systemFont(ofSize: 20, weight: .bold)

        tableVw.backgroundColor = .clear
        tableVw.separatorStyle = .singleLine
        tableVw.isHidden = true

        lblNoReview.text = NSLocalizedString("key_no_review_available", comment: "")
        lblNoReview.isHidden = false
    }

    override func constrain() {
        addConstrainedSubViews(lblTitleMovie, lblTitleReview, tableVw, lblNoReview)

        NSLayoutConstraint.activate([
            lblNoReview.centerXAnchor.constraint(equalTo: centerXAnchor),
            lblNoReview.centerYAnchor.constraint(equalTo: centerYAnchor),
            lblTitleReview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            lblTitleReview.centerXAnchor.constraint(equalTo: centerXAnchor),

            lblTitleMovie.topAnchor.constraint(equalTo: lblTitleReview.bottomAnchor, constant: 8),
            lblTitleMovie.centerXAnchor.constraint(equalTo: centerXAnchor),

            tableVw.topAnchor.constraint(equalTo: lblTitleMovie.bottomAnchor, constant: 8),
            tableVw.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableVw.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableVw.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
