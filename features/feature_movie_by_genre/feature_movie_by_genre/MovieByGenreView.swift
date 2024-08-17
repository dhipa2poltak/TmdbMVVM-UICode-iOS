//
//  MovieByGenreView.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import UIKit
import app_framework

class MovieByGenreView: ProgrammaticView {

    let lblTitle: UILabel = {
        let vw = UILabel()
        vw.font = .systemFont(ofSize: 20.0, weight: .bold)

        return vw
    }()

    let tableVw: UITableView = {
        let vw = UITableView()
        vw.backgroundColor = .clear
        vw.separatorStyle = .none

        return vw
    }()

    override func configure() {
        backgroundColor = .white
        addConstrainedSubViews(lblTitle, tableVw)
    }

    override func constrain() {
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
