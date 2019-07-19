//
//  ProfileViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 09/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    private enum TableViewConfig {
        static let headerHeight: CGFloat = 30

        // sum of leading and trailing padding constant of cellContent
        static let cellContentTotalhorizontalPadding: CGFloat = 40

        // vertical inset between cells in table view
        static let cellVerticalInset: CGFloat = 10

        // aspect ratio of height to width of image in table view cell from original design
        static let imageAspectRatio: CGFloat = 0.39

        static let topInset: CGFloat = 37
    }

    private var cellContentWidth: CGFloat {
        return tableView.frame.width - TableViewConfig.cellContentTotalhorizontalPadding
    }

    // MARK: - Stored Properties
    private var lectures = MockData.lectures()

    private var lecturesAttendanceView = UserProgressView.loadFromNib()
    private var assignmentsCompletionView = UserProgressView.loadFromNib()
    private var userInfoView = UserInfoView.loadFromNib()

    // MARK: - @IBOutlets
    @IBOutlet private weak var userInfoViewWrapper: UIView!
    @IBOutlet private weak var assignmentsCompletionViewWrapper: UIView!
    @IBOutlet private weak var lecturesAttendanceViewWrapper: UIView!
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
        return lectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LecturesTableViewCell = tableView.dequeReusableCell(for: indexPath)
        cell.configure(with: lectures[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDatasource methods

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: LecturesTableViewHeader = tableView.dequeReusableHeader()
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TableViewConfig.headerHeight
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellContentHeight = cellContentWidth * TableViewConfig.imageAspectRatio
        return cellContentHeight + TableViewConfig.cellVerticalInset
    }
}

// MARK: - Private setup methods

private extension ProfileViewController {

    func setup() {
        setupWrappers()
        setupTableView()
        setupProgressViews()
        view.backgroundColor = .almostBlack
    }

    func setupWrappers() {
        lecturesAttendanceViewWrapper.wrap(lecturesAttendanceView)
        assignmentsCompletionViewWrapper.wrap(assignmentsCompletionView)
        userInfoViewWrapper.wrap(userInfoView)

        userInfoViewWrapper.backgroundColor = .clear
        lecturesAttendanceViewWrapper.backgroundColor = .clear
        assignmentsCompletionViewWrapper.backgroundColor = .clear
    }

    func setupProgressViews() {
        lecturesAttendanceView.setProgressLevel(to: 2)
        lecturesAttendanceView.setLabel(to: "LECTURES ATTEDNED")
        assignmentsCompletionView.setLabel(to: "ASSIGNMENTS COMPLETED")
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .almostBlack
        tableView.separatorStyle = .none
        tableView.registerHeader(LecturesTableViewHeader.self)
        tableView.registerCell(LecturesTableViewCell.self)
    }
}
