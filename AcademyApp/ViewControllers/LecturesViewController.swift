//
//  LecturesViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 19/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

final class LecturesViewController: UIViewController {

    // MARK: - Stored properties

    var lectures = MockData.lectures()

    // MARK: - @IBOutletes

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - LifeCycle  methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}


// MARK: - UITableViewDataSource & UITableViewDelegate methods

extension LecturesViewController: UITableViewDataSource, UITableViewDelegate {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LecturesTableViewCell = tableView.dequeReusableCell(for: indexPath)
        cell.configure(with: lectures[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: LecturesTableViewHeader = tableView.dequeReusableHeader()
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // TODO: Reuturn headerView's intrinsic size
        return 30
    }
}


// MARK: - Private Setup methods

private extension LecturesViewController {

    func setup() {
        view.backgroundColor = .almostBlack
        setupTableView()
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .almostBlack
        tableView.separatorStyle = .none
        tableView.registerHeader(LecturesTableViewHeader.self)
        tableView.registerCell(LecturesTableViewCell.self)

        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 28
    }
}
