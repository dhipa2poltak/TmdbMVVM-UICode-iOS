//
//  ReviewView.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import UIKit

public class ReviewView: ProgrammaticView {

    public let lblContent: UILabel = {
        let vw = UILabel()
        vw.numberOfLines = 0

        return vw
    }()

    public let ivAuthor = UIImageView()

    public let lblAuthor: UILabel = {
        let vw = UILabel()
        vw.textAlignment = .right

        return vw
    }()

    public override func configure() {
        addConstrainedSubViews(lblContent, ivAuthor, lblAuthor)
    }

    public override func constrain() {
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
