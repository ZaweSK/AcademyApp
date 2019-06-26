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

    @IBOutlet private weak var lectureImageView: UIImageView!
    @IBOutlet private weak var lectureNameLabel: UILabel!
    @IBOutlet private weak var checkmarkImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}

// MARK: - Public setup methods

extension LecturesCollectionViewCell {
    func configure() {
        lectureImageView.image = UIImage(named: "Swift I (Playground)")
    }
}

// MARK: - Private UI setup methods

private extension LecturesCollectionViewCell {

    func setup() {
        setupLabel()
        setupCornerRadius()
        setupGradientLayer()
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

    func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.contentView.bounds
        gradientLayer.colors = [UIColor.firstColorForGradient, UIColor.secondColorForGradient]
        gradientLayer.locations = [ 0 ]
        contentView.layer.insertSublayer(gradientLayer, at: 1)
    }
}

extension LecturesCollectionViewCell: NibLoadableView {

    static var cellIdentifier: String {
        return self.defaultReuseIdentifier
    }
}
