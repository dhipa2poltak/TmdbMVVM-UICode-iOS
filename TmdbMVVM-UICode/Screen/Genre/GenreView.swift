//
//  GenreView.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import UIKit
import app_framework

class GenreView: ProgrammaticView {

    let lblTitle = UILabel()
    let tableVw = UITableView()

    override func configure() {
        backgroundColor = .white

        lblTitle.text = NSLocalizedString("key_movie_genres", comment: "")
        lblTitle.font = .systemFont(ofSize: 20, weight: .bold)

        tableVw.backgroundColor = .clear
        tableVw.separatorStyle = .none
    }

    override func constrain() {
        addConstrainedSubViews(lblTitle, tableVw)

        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            lblTitle.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            tableVw.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 8),
            tableVw.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableVw.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableVw.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
