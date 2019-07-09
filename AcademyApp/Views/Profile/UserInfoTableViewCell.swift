//
//  UserInfoTableViewCell.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 09/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

final class UserInfoTableViewCell: UITableViewCell, NibLoadableView {

    // MARK: - @IBOutlets

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
    }

    func setupUserPictureImageView() {
        userPictureImageView.layer.cornerRadius = userPictureImageView.frame.width / 2
        userPictureImageView.clipsToBounds = true
    }
}
