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

    override func configure() {
        backgroundColor = .white

        lblTitleMovie.font = .systemFont(ofSize: 20, weight: .bold)
        lblTitleReview.text = "Review"
        lblTitleReview.font = .systemFont(ofSize: 20, weight: .bold)

        tableVw.backgroundColor = .clear
        tableVw.separatorStyle = .singleLine
    }

    override func constrain() {
        addConstrainedSubViews(lblTitleMovie, lblTitleReview, tableVw)

        NSLayoutConstraint.activate([
            lblTitleMovie.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            lblTitleMovie.centerXAnchor.constraint(equalTo: centerXAnchor),
            lblTitleReview.topAnchor.constraint(equalTo: lblTitleMovie.bottomAnchor, constant: 8),
            lblTitleReview.centerXAnchor.constraint(equalTo: centerXAnchor),
            tableVw.topAnchor.constraint(equalTo: lblTitleReview.bottomAnchor, constant: 8),
            tableVw.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableVw.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableVw.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
