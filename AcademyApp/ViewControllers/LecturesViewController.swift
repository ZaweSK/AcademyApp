//
//  LecturesViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 19/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class LecturesViewController: UIViewController {

    var lectures = ["a", "b", "c", "d", "e", "f"]

    @IBOutlet weak var lecturesLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

}

private extension LecturesViewController {

    func setup() {
        delegatesSetup()
    }

    func delegatesSetup() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension LecturesViewController: UITableViewDelegate {

}

extension LecturesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "lecturesTableViewCell", for: indexPath)
            as? LecturesTableViewCell
            else {
                return UITableViewCell()
        }
        cell.lectureImageView.image = UIImage(named: "Swift I (Playground)")
        return cell
    }

}
