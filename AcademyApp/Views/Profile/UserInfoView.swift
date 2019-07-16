//
//  UserInfoView.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 10/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class UserInfoView: UIView, NibLoadable {

    // MARK: - Stored Properties

    var contentView = UIView()

    // MARK: - @IBOutlets

    @IBOutlet private weak var pickProfilePictureButton: UIButton!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userPictureImageView: UIImageView!
    @IBOutlet private weak var cellView: UIView!

    // MARK: - Life Cycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

}

// MARK: - Private setup methods

private extension UserInfoView {
    func setupUI() {
        setupUserPictureImageView()
        setupUserNameLabel()
        cellView.backgroundColor = .almostBlack
    }

    func setupUserPictureImageView() {
        userPictureImageView.layer.cornerRadius = userPictureImageView.frame.width / 2
        userPictureImageView.clipsToBounds = true
    }

    func setupUserNameLabel() {
        userNameLabel.attributedText = NSAttributedString(string: userNameLabel.text ?? "ADAM ROLLER", attributes: [
            // TODO: Update font setting
            NSAttributedString.Key.font: UIFont(name: "TrumpGothicEast-Bold", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.kern: 1
            ])
    }
}
