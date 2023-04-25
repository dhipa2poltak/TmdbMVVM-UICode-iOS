//
//  ReviewView.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import UIKit

class ReviewView: ProgrammaticView {

    let lblContent = UILabel()
    let ivAuthor = UIImageView()
    let lblAuthor = UILabel()

    override func configure() {
        lblContent.numberOfLines = 0
        lblAuthor.textAlignment = .right
    }

    override func constrain() {
        addConstrainedSubViews(lblContent, ivAuthor, lblAuthor)

        NSLayoutConstraint.activate([
            lblContent.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            lblContent.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            lblContent.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lblContent.heightAnchor.constraint(lessThanOrEqualToConstant: 120),

            ivAuthor.topAnchor.constraint(equalTo: lblContent.bottomAnchor, constant: 10),
            ivAuthor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            ivAuthor.widthAnchor.constraint(equalToConstant: 43),
            ivAuthor.heightAnchor.constraint(equalToConstant: 43),

            lblAuthor.topAnchor.constraint(equalTo: ivAuthor.bottomAnchor, constant: 10),
            lblAuthor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            lblAuthor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lblAuthor.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -12.5)
        ])
    }
}
