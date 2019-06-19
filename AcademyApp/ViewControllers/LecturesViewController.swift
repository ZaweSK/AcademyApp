//
//  LecturesViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 19/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class LecturesViewController: UIViewController {


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

    }
}
