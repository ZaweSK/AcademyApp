//
//  ProfileViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 09/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Stored Properties

    var lecturesAttendanceView = UserProgressView.loadFromNib()
    var assignmentsCompletionView = UserProgressView.loadFromNib()
    var userInfoView = UserInfoView.loadFromNib()

    // MARK: - @IBOutlets
    @IBOutlet private weak var userInfoViewWrapper: UIView!
    @IBOutlet private weak var assignmentsCompletionViewWrapper: UIView!
    @IBOutlet private weak var lecturesAttendanceViewWrapper: UIView!
    // MARK: - LifeCycle methods

    override func viewDidLoad() {
        super.viewDidLoad()


        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family : \(family) Font names: \(names)")
        }
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
        setupWrappers()
        view.backgroundColor = .almostBlack
    }

    func setupWrappers() {
        lecturesAttendanceViewWrapper.wrap(lecturesAttendanceView)
        assignmentsCompletionViewWrapper.wrap(assignmentsCompletionView)
        userInfoViewWrapper.wrap(userInfoView)

        lecturesAttendanceView.setProgressLevel(to: 2)
    }

}
