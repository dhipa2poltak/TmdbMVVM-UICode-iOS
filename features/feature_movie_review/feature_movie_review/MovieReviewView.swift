//
//  MovieReviewView.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import UIKit
import app_framework

class MovieReviewView: ProgrammaticView {

    let lblTitleMovie: UILabel = {
        let vw = UILabel()
        vw.font = .systemFont(ofSize: 20, weight: .bold)

        return vw
    }()


    let lblTitleReview: UILabel = {
        let vw = UILabel()
        vw.text = NSLocalizedString("key_review", comment: "")
        vw.font = .systemFont(ofSize: 20, weight: .bold)

        return vw
    }()

    let tableVw: UITableView = {
        let vw = UITableView()
        vw.backgroundColor = .clear
        vw.separatorStyle = .singleLine
        vw.isHidden = true

        return vw
    }()

    let lblNoReview: UILabel = {
        let vw = UILabel()
        vw.text = NSLocalizedString("key_no_review_available", comment: "")
        vw.isHidden = false

        return vw
    }()

    override func configure() {
        backgroundColor = .white
        addConstrainedSubViews(lblTitleMovie, lblTitleReview, tableVw, lblNoReview)
    }

    override func constrain() {
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
