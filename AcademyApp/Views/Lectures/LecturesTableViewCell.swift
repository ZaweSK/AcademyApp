//
//  LecturesTableViewCell.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 01/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class LecturesTableViewCell: UITableViewCell, NibLoadableView {

    // MARK: - Stored Properties

    private let gradientLayer = CAGradientLayer()

    // MARK: - @IBOutlets

    @IBOutlet private weak var cellView: UIView!
    @IBOutlet private weak var lectureNameLabel: UILabel!
    @IBOutlet private weak var checkmarkImageView: UIImageView!
    @IBOutlet private weak var lectureImageView: UIImageView!

    // LifeCycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = cellView.bounds
    }

    override func prepareForReuse() {
        lectureImageView.image = nil
        lectureNameLabel.text = nil
    }
}

// MARK: - Public methods

extension LecturesTableViewCell {

    func configure(with lecture: Lecture) {
        lectureNameLabel.text = lecture.lectureName
        lectureImageView.image = lecture.lectureCellImage
    }
}

// MARK: - Private Setup methods

private extension LecturesTableViewCell {

    func setup() {
        setupGradientLayer()
        setupCornerRadius()
        setupLectureNameLabel()
        selectionStyle = .none
    }

    func setupCornerRadius() {
        cellView.layer.cornerRadius = 5
        cellView.layer.masksToBounds = true
    }

    func setupLectureNameLabel() {
        lectureNameLabel.font = UIFont.TrumpGothic.bold(32)
    }

    func setupGradientLayer() {
        gradientLayer.colors = [UIColor.black0, UIColor.black80]
        lectureImageView.layer.addSublayer(gradientLayer)
    }
}
