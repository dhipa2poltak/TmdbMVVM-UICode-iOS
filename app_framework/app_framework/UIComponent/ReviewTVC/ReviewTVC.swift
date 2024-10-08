//
//  ReviewTVC.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import Kingfisher
import UIKit
import domain

public class ReviewTVC: UITableViewCell {

    public let vw: ReviewView = {
        let vw = ReviewView()
        vw.layer.borderWidth = 1
        vw.layer.borderColor = UIColor.lightGray.cgColor
        vw.translatesAutoresizingMaskIntoConstraints = false

        return vw
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initView() {
        selectionStyle = .none
        contentView.addSubview(vw)

        NSLayoutConstraint.activate([
            vw.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            vw.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            vw.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            vw.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    public func bindData(review: ReviewEntity) {
        vw.lblContent.text = review.content

        if let avatarPath = review.authorDetails?.avatarPath {
            vw.ivAuthor.kf.setImage(with: URL(string: avatarPath))
        }

        vw.lblAuthor.text = review.author
    }
}
