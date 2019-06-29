//
//  LectureTableViewCell.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 28/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class LectureTableViewCell: UITableViewCell {

    @IBOutlet private weak var cellView: UIView!
    @IBOutlet private weak var lectureImageView: UIImageView!
    @IBOutlet private weak var lectureNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}

// MARK: - Public methods

extension LectureTableViewCell {

    func configure(with lecture: Lecture) {
        lectureImageView.image = lecture.lectureCellImage
        lectureNameLabel.text = lecture.lectureName
    }
}

private extension LectureTableViewCell {

    func setup() {
        setupCornerRadius()
        setupGradientLayer()
    }

    func setupCornerRadius() {
        cellView.layer.cornerRadius = 5
        cellView.layer.masksToBounds = true
    }

    func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = cellView.bounds
        gradientLayer.colors = [UIColor.firstColorForGradient, UIColor.secondColorForGradient]
        gradientLayer.locations = [ -0.3]
        cellView.layer.insertSublayer(gradientLayer, at: 1 )
    }
}
