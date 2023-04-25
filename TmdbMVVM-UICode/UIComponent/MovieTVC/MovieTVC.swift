//
//  MovieTVC.swift
//  TmdbMVVM-UICode
//
//  Created by user on 25/04/23.
//

import Foundation
import Kingfisher
import UIKit

class MovieTVC: UITableViewCell {

    private let vw = MovieView()

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

    func bindData(imageUrl: String?, title: String?, overview: String?) {
        if let imageUrl = imageUrl, !imageUrl.isEmpty {
            vw.ivMovie.kf.setImage(with: URL(string: imageUrl))
        }

        vw.lblTitle.text = title
        vw.lblOverview.text = overview
    }
}
