//
//  LecturesCollectionViewCell.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 21/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class LecturesCollectionViewCell: UICollectionViewCell {

    var lectureName: String? {
        didSet {
            setup()
        }
    }

    @IBOutlet weak var lectureImageView: UIImageView!
    @IBOutlet weak var lectureNameLabel: UILabel!
    @IBOutlet weak var checkmarkImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}

// MARK: - UI setup methods

private extension LecturesCollectionViewCell {

    func setup() {
        setupLabel()
        setupCornerRadius()
    }

    func setupLabel() {

        let attributedLectureName = NSAttributedString(string: lectureName ?? "LECTURE", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.lectureNameTextColor,
            NSAttributedString.Key.font: UIFont.lectureNameFont,
            NSAttributedString.Key.kern: 0
            ])

        lectureNameLabel.attributedText = attributedLectureName
    }

    func setupCornerRadius() {
        self.layer.cornerRadius = 5
    }
}
