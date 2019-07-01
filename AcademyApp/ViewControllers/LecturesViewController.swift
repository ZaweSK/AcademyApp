//
//  LecturesViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 19/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

final class LecturesViewController: UIViewController {

    private enum TableViewConfig {
        static let headerHeight: CGFloat = 30

        // sum of leading and trailing padding constant of cellContent
        static let cellTotalhorizontalPadding: CGFloat = 40

        // vertical inset between cells in table view
        static let cellVerticalInset: CGFloat = 10

        // aspect ratio of height to width of image in table view cell from original design
        static let imageAspectRatio: CGFloat = 0.39
    }


    // MARK: - Stored properties

    var lectures = MockData.lectures()

    // MARK: - Computed Properities

    private var cellWidth: CGFloat {
        print(tableView.frame.width - TableViewConfig.cellTotalhorizontalPadding)
        return tableView.frame.width - TableViewConfig.cellTotalhorizontalPadding
    }

    // MARK: - @IBOutletes

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - LifeCycle  methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}


// MARK: - UITableViewDataSource & UITableViewDelegate methods

extension LecturesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LecturesTableViewCell = tableView.dequeReusableCell(for: indexPath)
        cell.configure(with: lectures[indexPath.row])
        return cell
    }

}

extension LecturesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: LecturesTableViewHeader = tableView.dequeReusableHeader()
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TableViewConfig.headerHeight
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellContentHeight = cellWidth * TableViewConfig.imageAspectRatio
        return cellContentHeight + TableViewConfig.cellVerticalInset
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
    }
}
