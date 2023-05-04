//
//  ViewController.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import SVProgressHUD
import UIKit
import app_framework

public class GenreVC: BaseVC<GenreVM> {

    private let vw = GenreView()

    public var navigationService: NavigationProtocol?

    private let cellId = "GenreContentTVC"

    private lazy var refreshControl: UIRefreshControl = {
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(didRefreshControl), for: .valueChanged)
        return rc
    }()

    public override func loadView() {
        super.loadView()

        view = vw
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        super.setupNavBar()
        // Do any additional setup after loading the view.
        //view.backgroundColor = .red
        print("Current configuration: \(BuildConfiguration.shared.environment)")
        print("Base URL: \(BuildConfiguration.shared.API_BASE_URL)")

        setupTableView()
        setupObserver()

        viewModel?.loadData()
    }

    private func setupTableView() {
        if #available(iOS 10.0, *) {
            vw.tableVw.refreshControl = refreshControl
        } else {
            vw.tableVw.addSubview(refreshControl)
        }

        vw.tableVw.dataSource = self
        vw.tableVw.delegate = self

        vw.tableVw.register(GenreContentTVC.self, forCellReuseIdentifier: cellId)
    }

    public override func setupObserver() {
        super.setupObserver()

        viewModel?.isShowDialogLoading.bind { value in
            if value {
                SVProgressHUD.show()
            } else {
                SVProgressHUD.dismiss()
            }
        }

        viewModel?.genreData.bind { [weak self] value in
            if let theValue = value, theValue {
                self?.refreshControl.endRefreshing()
                self?.vw.tableVw.reloadData()
                self?.viewModel?.genreData.value = false
            }
        }
    }

    @objc private func didRefreshControl() {
        viewModel?.loadData()
    }
}

extension GenreVC: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.genres?.count ?? 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! GenreContentTVC
        cell.selectionStyle = .none

        if let genre = viewModel?.genres?[indexPath.row] {
            cell.bindData(genreName: genre.name)
        }

        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genre = viewModel?.genres?[indexPath.row]
        navigationService?.showMovieByGenre(genreId: genre?.id ?? -1, genreName: genre?.name ?? "unknown")
    }
}
