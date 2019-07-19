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
    private var imagePicker = UIImagePickerController()
    private var dataSource = LecturesDataSource()

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


// MARK: - PickProfilePictureDelegate methods

extension ProfileViewController: PickProfilePictureDelegate {

    func pickProfilePicture() {

        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let uploadPictureAction = UIAlertAction(title: "Upload Profile Picture", style: .default) { _ in
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let signOutAction = UIAlertAction(title: "Sign Out", style: .destructive, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(uploadPictureAction)
        alertController.addAction(signOutAction)
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UIImagePicker delegate methods

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            userInfoView.setImage(userPickedImage)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Private setup methods

private extension ProfileViewController {

    func setup() {
        setupWrappers()
        setupTableView()
        setupProgressViews()
        setupImagePicker()
        view.backgroundColor = .almostBlack

        userInfoView.pickProfilePictureDelegate = self
    }

    func setupWrappers() {
        lecturesAttendanceViewWrapper.wrap(lecturesAttendanceView)
        assignmentsCompletionViewWrapper.wrap(assignmentsCompletionView)
        userInfoViewWrapper.wrap(userInfoView)

        userInfoViewWrapper.backgroundColor = .clear
        lecturesAttendanceViewWrapper.backgroundColor = .clear
        assignmentsCompletionViewWrapper.backgroundColor = .clear
    }

    func setupImagePicker() {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
    }

    func setupProgressViews() {
        lecturesAttendanceView.setProgressLevel(to: 2)
        lecturesAttendanceView.setLabel(to: "LECTURES ATTEDNED")
        assignmentsCompletionView.setLabel(to: "ASSIGNMENTS COMPLETED")
    }

    func setupTableView() {
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.backgroundColor = .almostBlack
        tableView.separatorStyle = .none
        tableView.registerHeader(LecturesTableViewHeader.self)
        tableView.registerCell(LecturesTableViewCell.self)
    }
}
