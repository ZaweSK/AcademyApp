//
//  LecturesViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 19/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

final class LecturesViewController: UIViewController {

    // MARK: - Constants

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

    // MARK: - Stored properties
    private var dataSource = LecturesDataSource()

    // MARK: - Computed Properities

    private var cellContentWidth: CGFloat {
        return tableView.frame.width - TableViewConfig.cellContentTotalhorizontalPadding
    }

    // MARK: - @IBOutletes

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - LifeCycle  methods

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = LecturesDataSource()

        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
}

// MARK: - UITableViewDelegate methods

extension LecturesViewController: UITableViewDelegate {

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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToLectureDetailViewController", sender: self)
    }
}

// MARK: - Navigation

extension LecturesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToLectureDetailViewController" {

            // to be used later on ...

            guard let indexPath = tableView.indexPathForSelectedRow,
                let detailVC = segue.destination as? LectureDetailViewController else {
                return
            }

            detailVC.configure(with: dataSource.lectures[indexPath.row])
        }
    }
}


// MARK: - Private Setup methods

private extension LecturesViewController {

    func setup() {
        view.backgroundColor = .almostBlack
        setupTableView()
    }

    func setupTableView() {
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.backgroundColor = .almostBlack
        tableView.separatorStyle = .none
        tableView.registerHeader(LecturesTableViewHeader.self)
        tableView.registerCell(LecturesTableViewCell.self)
        tableView.contentInset = UIEdgeInsets(top: TableViewConfig.topInset, left: 0, bottom: 0, right: 0)
    }

    func setupNavBar() {
        // Hide navigation Bar
        navigationController?.setNavigationBarHidden(true, animated: true)

        // Set the title for back button in nav bar (is visible when there is another view controller on top of
        // this one in navigation stack)
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
    }
}
