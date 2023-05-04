//
//  MovieView.swift
//  TmdbMVVM-UICode
//
//  Created by user on 25/04/23.
//

import Foundation
import UIKit

public class MovieView: ProgrammaticView {
    
    public let ivMovie = UIImageView()
    public let lblTitle = UILabel()
    public let lblOverview = UILabel()

    public override func configure() {
        ivMovie.contentMode = .scaleAspectFit
        lblTitle.font = UIFont.boldSystemFont(ofSize: 17)
        lblTitle.numberOfLines = 0
        lblOverview.numberOfLines = 0
    }

    public override func constrain() {
        addConstrainedSubViews(ivMovie, lblTitle, lblOverview)

        NSLayoutConstraint.activate([
            ivMovie.widthAnchor.constraint(equalToConstant: 100),
            ivMovie.heightAnchor.constraint(equalToConstant: 100),
            ivMovie.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            ivMovie.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            ivMovie.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            lblTitle.leadingAnchor.constraint(equalTo: ivMovie.trailingAnchor, constant: 8),
            lblTitle.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            lblTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            lblOverview.leadingAnchor.constraint(equalTo: ivMovie.trailingAnchor, constant: 8),
            lblOverview.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 8),
            lblOverview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lblOverview.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -16)
        ])
    }
}
