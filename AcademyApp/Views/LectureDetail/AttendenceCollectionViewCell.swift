//
//  AttendenceCollectionViewCell.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 03/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class AttendenceCollectionViewCell: UICollectionViewCell {

    // MARK: - @IBOutlets

    @IBOutlet weak var attendanceSwitch: UISwitch!
    @IBOutlet weak var attendedLabel: UILabel!

    // MARK:: - LifeCycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

// MAKR: - Private setup methods

private extension AttendenceCollectionViewCell {

    func setup() {
        setupAttendanceSwitch()
        setupAttendedLabel()
    }git a

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
            NSAttributedString.Key.font: UIFont.attendedLabelFont
            ])
    }
}
