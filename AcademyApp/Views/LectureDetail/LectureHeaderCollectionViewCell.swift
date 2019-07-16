//
//  OverviewCollectionViewCell.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 02/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

final class LectureHeaderCollectionViewCell: UICollectionViewCell, NibLoadable {

    // MARK: - Stored Propertie

    private let gradientLayer = CAGradientLayer()

    /// ratios from original design
    private enum AspectRatioConfig {
        static let imageViewHeightToScreenHeight: CGFloat = 0.6
        static let gradientLayerHeightToImageViewHeight: CGFloat = 0.57
    }

    // MARK: - @IBOutlets

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var lectureImageView: UIImageView!
    @IBOutlet private weak var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var lectureNameLabel: UILabel!
    @IBOutlet private weak var gradientLayerView: UIView!
    @IBOutlet private weak var gradientLayerViewHeightConstraint: NSLayoutConstraint!

    // MARK: - LifeCycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: gradientLayerViewHeightConstraint.constant)
    }

    // needs to be implemented in order for autoresizing of cell to work correctly
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutAttributes.bounds.size.width = UIScreen.main.bounds.width
        layoutAttributes.bounds.size.height = containerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return layoutAttributes
    }
}

// MARK: - Public methods

extension LectureHeaderCollectionViewCell {
    func configure(with lecture: Lecture) {
        lectureNameLabel.text = lecture.lectureName
    }
}

// MAKR: - Private setup methods

private extension LectureHeaderCollectionViewCell {

    func setup() {
        setupSegmentedControl()
        setupGradientLayer()
        setupAspectRatio()
        setupLabel()
    }

    // methods set's up auto layout constraint accordingly to aspect ratios from original design
    func setupAspectRatio() {
        imageViewHeightConstraint.constant = UIScreen.main.bounds.height * AspectRatioConfig.imageViewHeightToScreenHeight
        gradientLayerViewHeightConstraint.constant = imageViewHeightConstraint.constant * AspectRatioConfig.gradientLayerHeightToImageViewHeight
    }

    func fontAttributes(controlIsSelected: Bool) -> [NSAttributedString.Key: Any] {
        let fontColor: UIColor = controlIsSelected ? .white : .pinkishRed
        let attributes: [NSAttributedString.Key: Any] =  [
            NSAttributedString.Key.foregroundColor: fontColor,
            NSAttributedString.Key.font: UIFont.MaisonNeue.medium(13),
            NSAttributedString.Key.kern: 1
        ]
        return attributes
    }

    func setupSegmentedControl() {
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .pinkishRed
        segmentedControl.setTitleTextAttributes(fontAttributes(controlIsSelected: false), for: .normal)
        segmentedControl.setTitleTextAttributes(fontAttributes(controlIsSelected: true), for: .selected)
    }

    func setupGradientLayer() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black90.cgColor]
        gradientLayerView.layer.addSublayer(gradientLayer)
    }

    func setupLabel() {
        lectureNameLabel.font = UIFont.TrumpGothic.bold(52)
        lectureNameLabel.textColor = .white
    }
}
