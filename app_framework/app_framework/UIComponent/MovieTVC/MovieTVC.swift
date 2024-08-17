//
//  MovieTVC.swift
//  TmdbMVVM-UICode
//
//  Created by user on 25/04/23.
//

import Foundation
import Kingfisher
import UIKit

public class MovieTVC: UITableViewCell {

    public let vw: MovieView = {
        let vw = MovieView()
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

    public func bindData(imageUrl: String?, title: String?, overview: String?) {
        if let imageUrl = imageUrl, !imageUrl.isEmpty {
            vw.ivMovie.kf.setImage(with: URL(string: imageUrl))
        }

        vw.lblTitle.text = title
        vw.lblOverview.text = overview
    }
}
