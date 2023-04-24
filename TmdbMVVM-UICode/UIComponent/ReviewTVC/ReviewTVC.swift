//
//  ReviewTVC.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import Kingfisher
import UIKit

class ReviewTVC: UITableViewCell {

    private let vw = ReviewView()

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
        vw.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vw.topAnchor.constraint(equalTo: contentView.topAnchor),
            vw.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            vw.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            vw.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func bindData(review: ReviewEntity) {
        vw.lblContent.text = review.content

        if let avatarPath = review.authorDetails?.avatarPath {
            vw.ivAuthor.kf.setImage(with: URL(string: avatarPath))
        }

        vw.lblAuthor.text = review.author
    }
}
