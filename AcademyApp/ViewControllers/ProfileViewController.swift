//
//  ProfileViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 09/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {


    // MARK: - @IBOutlets

    @IBOutlet weak var userProgressViewWrapper: UIView!
    var userProgressView = UserProgressView()

    // MARK: - LifeCycle methods

    override func viewDidLoad() {
        super.viewDidLoad()


        setup()
    }
}

// MARK: - UITableViewDelegate methods

//extension ProfileViewController: UITableViewDataSource {
//
//}

// MARK: - UITableViewDatasource methods

extension ProfileViewController: UITableViewDelegate {

}

// MARK: - Private setup methods

private extension ProfileViewController {

    func setup() {
        userProgressViewWrapper.wrap(userProgressView)
    }

}
