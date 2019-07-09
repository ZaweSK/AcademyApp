//
//  LecturesListTableViewCell.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 09/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class LecturesListTableViewCell: UITableViewCell, NibLoadableView {

    let lectures = MockData.lectures()

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.registerHeader(LecturesTableViewHeader.self)
            tableView.registerCell(LecturesTableViewCell.self)
            tableView.dataSource = self
            tableView.delegate = self
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension LecturesListTableViewCell: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header: LecturesTableViewHeader = tableView.dequeReusableHeader()
//        return header
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 30
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 140
//    }
}

extension LecturesListTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LecturesTableViewCell = tableView.dequeReusableCell(for: indexPath)
        cell.configure(with: lectures[indexPath.row])
        return cell
    }
}
