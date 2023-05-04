//
//  MovieByGenreVC.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import SVProgressHUD
import UIKit
import app_framework

class MovieByGenreVC: BaseVC<MovieByGenreVM> {

    let vw = MovieByGenreView()

    weak var coordinator: AppCoordinator?

    private let cellId = "MovieTVC"

    override func loadView() {
        super.loadView()
        view = vw
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        super.setupNavBar()

        if !(viewModel?.genreName.isEmpty ?? true) {
            vw.lblTitle.text = String(format: NSLocalizedString("key_title_movies_in_genre", comment: ""), viewModel?.genreName ?? "unknown")
        }

        setupObserver()

        vw.tableVw.delegate = self
        vw.tableVw.dataSource = self

        vw.tableVw.register(MovieTVC.self, forCellReuseIdentifier: cellId)

        vw.tableVw.reloadData()

        if let viewModel = viewModel {
            viewModel.fetchMovieGenre(genreId: String(viewModel.genreId), page: viewModel.page)
        }
    }

    override func setupObserver() {
        super.setupObserver()

        viewModel?.isShowDialogLoading.bind { [weak self] value in
            if value && self?.viewModel?.movies.isEmpty ?? true {
                SVProgressHUD.show()
            } else {
                SVProgressHUD.dismiss()
            }
        }

        viewModel?.movieData.bind { [weak self] value in
            if let theValue = value, theValue {
                self?.vw.tableVw.reloadData()
                self?.viewModel?.movieData.value = nil
            }
        }
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity _: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)

        if distance < 200, let viewModel = viewModel {
            viewModel.fetchMovieGenre(genreId: String(viewModel.genreId), page: viewModel.page + 1)
        }
    }
}

extension MovieByGenreVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.movies.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieTVC
        cell.selectionStyle = .none

        let movie = viewModel?.movies[indexPath.row]
        cell.bindData(imageUrl: movie?.imageUrl, title: movie?.title, overview: movie?.overview)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel?.movies[indexPath.row]
        coordinator?.showMovieDetail(movieId: movie?.id ?? -1)
    }
}
