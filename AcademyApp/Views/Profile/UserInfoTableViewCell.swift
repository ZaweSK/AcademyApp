//
//  UserInfoTableViewCell.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 09/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

final class UserInfoTableViewCell: UITableViewCell, NibLoadable {

    // MARK: - @IBOutlets

    @IBOutlet private weak var cellView: UIView!
    @IBOutlet private weak var userPictureImageView: UIImageView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var pickProfilePictureButton: UIButton!

    // MARK: - LifeCycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

private extension UserInfoTableViewCell {
    func setup() {
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
