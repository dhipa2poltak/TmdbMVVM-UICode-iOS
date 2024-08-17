//
//  MovieView.swift
//  TmdbMVVM-UICode
//
//  Created by user on 25/04/23.
//

import Foundation
import UIKit

public class MovieView: ProgrammaticView {
    
    public let ivMovie: UIImageView = {
        let vw = UIImageView()
        vw.contentMode = .scaleAspectFit

        return vw
    }()

    public let lblTitle: UILabel = {
        let vw = UILabel()
        vw.font = UIFont.boldSystemFont(ofSize: 17)
        vw.numberOfLines = 0

        return vw
    }()

    public let lblOverview: UILabel = {
        let vw = UILabel()
        vw.numberOfLines = 0

        return vw
    }()

    public override func configure() {
        addConstrainedSubViews(ivMovie, lblTitle, lblOverview)
    }

    public override func constrain() {
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
