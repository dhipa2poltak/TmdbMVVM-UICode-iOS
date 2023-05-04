//
//  GenreView.swift
//  TmdbMVVM-UICode
//
//  Created by user on 25/04/23.
//

import Foundation
import UIKit

public class GenreContentView: ProgrammaticView {

    public let lblGenre = UILabel()

    public override func configure() {

    }

    public override func constrain() {
        addConstrainedSubViews(lblGenre)

        NSLayoutConstraint.activate([
            lblGenre.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            lblGenre.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            lblGenre.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lblGenre.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
