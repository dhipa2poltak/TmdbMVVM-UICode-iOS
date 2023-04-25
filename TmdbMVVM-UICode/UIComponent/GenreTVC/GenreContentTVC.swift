//
//  GenreTVC.swift
//  TmdbMVVM-UICode
//
//  Created by user on 25/04/23.
//

import Foundation
import UIKit

class GenreContentTVC: UITableViewCell {

    private let vw = GenreContentView()

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

    func bindData(genreName: String?) {
        vw.lblGenre.text = genreName
    }
}
