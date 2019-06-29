//
//  LecturesViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 19/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

final class LecturesViewController: UIViewController {

    var lectures = MockData.lectures()

    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension LecturesViewController: UITableViewDelegate {

}

extension LecturesViewController: UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "lectureTableViewCell", for: indexPath) as? LectureTableViewCell  else {
            return UITableViewCell()
        }

        cell.configure(with: lectures[indexPath.row])

        return cell
    }
}


// MARK: - Setup

extension LecturesViewController {

    func setup() {
        view.backgroundColor = .almostBlack
        setupTableView()
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .almostBlack
        tableView.register(UINib(nibName: "LectureTableViewCell", bundle: nil), forCellReuseIdentifier: "lectureTableViewCell")
        tableView.separatorStyle = .none
    }
}
