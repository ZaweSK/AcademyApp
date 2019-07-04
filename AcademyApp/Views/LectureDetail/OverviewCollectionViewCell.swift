//
//  OverviewCollectionViewCell.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 02/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

protocol BackButtonDelegate: class {
    func didTapBackButton()
}

class OverviewCollectionViewCell: UICollectionViewCell, NibLoadableView {

    // MARK: - Stored Properties

    private var gradientLayer = CAGradientLayer()
    weak var delegate: BackButtonDelegate?

    // MARK: - @IBOutlets

    @IBOutlet private weak var gradientLayerView: UIView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var lectureNameLabel: UILabel!
    @IBOutlet private weak var lectureImageView: UIImageView!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!

    // MARK: - @IBActions

    @IBAction private func backArrowButtonTapped(_ sender: UIButton) {
        delegate?.didTapBackButton()
    }

    // MARK: - LifeCycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = gradientLayerView.bounds
    }

    // needs to be implemented in order for autoresizing of cell to work correctly
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutAttributes.bounds.size.width = UIScreen.main.bounds.width
        layoutAttributes.bounds.size.height = containerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return layoutAttributes
    }
}

// MAKR: - Private setup methods

private extension OverviewCollectionViewCell {

    func setup() {
        setupSegmentedControl()
        setupGradientLayer()
    }

    func fontAttributes(controlIsSelected: Bool) -> [NSAttributedString.Key: Any] {
        let fontColor: UIColor = controlIsSelected ? .white : .pinkishRed
        let attributes: [NSAttributedString.Key: Any] =  [
            NSAttributedString.Key.foregroundColor: fontColor,
            NSAttributedString.Key.font: UIFont.segmentedControlFont,
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
        gradientLayerView.layer.insertSublayer(gradientLayer, at: 0)
    }
}
