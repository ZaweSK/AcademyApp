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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup() {
        contentView = loadViewFromNib()
        addSubview(contentView)

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true

        setupUI()
    }

    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: type(of: self).nibName, bundle: bundle)

        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {
            fatalError("Unable to instatie nib file")
        }
        return view
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
