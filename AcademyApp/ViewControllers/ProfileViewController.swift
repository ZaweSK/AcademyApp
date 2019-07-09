//
//  ProfileViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 09/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    private enum Sections: Int, CaseIterable {
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

//extension ProfileViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//}

// MARK: - UITableViewDatasource methods

extension ProfileViewController: UITableViewDelegate {

}

// MARK: - Private setup methods

private extension ProfileViewController {

    func setup() {
        setupTableView()
    }

    func setupTableView() {
        tableView.delegate = self
//        tableView.dataSource = self
    }
}
