//
//  ProfileViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 09/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    private enum Section: Int, CaseIterable {
        case userInfo = 0
        case progress
        case lectures
    }

    // MARK: - @IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - LifeCycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

// MARK: - UITableViewDelegate methods

extension ProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Section.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let section = Section(rawValue: indexPath.row) else {
            fatalError("Unable to detect section from initializer index path: \(indexPath)")
        }

        switch section {
        case .userInfo:
            let cell: UserInfoTableViewCell = tableView.dequeReusableCell(for: indexPath)
            cell.selectionStyle = .none
            return cell

        case .progress:
            let cell: UserProgressTableViewCell = tableView.dequeReusableCell(for: indexPath)
            cell.selectionStyle = .none
            return cell

        case .lectures:
            let cell: LecturesListTableViewCell = tableView.dequeReusableCell(for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
    }
}

// MARK: - UITableViewDatasource methods

extension ProfileViewController: UITableViewDelegate {

}

// MARK: - Private setup methods

private extension ProfileViewController {

    func setup() {
        setupTableView()

        view.backgroundColor = .almostBlack
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.registerCell(UserInfoTableViewCell.self)
        tableView.registerCell(UserProgressTableViewCell.self)
        tableView.registerCell(LecturesListTableViewCell.self)
    }
}
