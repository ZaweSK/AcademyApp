//
//  AttendenceCollectionViewCell.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 03/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

final class LectureAttendenceCollectionViewCell: UICollectionViewCell, NibLoadable {

    // MARK: - @IBOutlets

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var attendanceSwitch: UISwitch!
    @IBOutlet private weak var attendedLabel: UILabel!

    // MARK: - LifeCycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    // needs to be implemented in order for autoresizing of cell to work correctly
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutAttributes.bounds.size.width = UIScreen.main.bounds.width
        layoutAttributes.bounds.size.height = containerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return layoutAttributes
    }
}

// MAKR: - Private setup methods

private extension LectureAttendenceCollectionViewCell {

    func setup() {
        setupAttendanceSwitch()
        setupAttendedLabel()
        containerView.backgroundColor = .almostBlack
    }

    func setupAttendanceSwitch() {
        attendanceSwitch.onTintColor = .pinkishRed
        attendanceSwitch.tintColor = .black10
        attendanceSwitch.backgroundColor = .greyishBrownTwo
        attendanceSwitch.layer.cornerRadius = attendanceSwitch.frame.height / 2
    }

    func setupAttendedLabel() {
        attendedLabel.attributedText = NSAttributedString(string: attendedLabel.text ?? "Attended", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.kern: -0.41,
            NSAttributedString.Key.font: UIFont.MaisonNeue.medium(16)
            ])
    }
}
