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

class LectureHeaderCollectionViewCell: UICollectionViewCell, NibLoadableView {

    // MARK: - Stored Properties


    private var gradientLayer = CAGradientLayer()
    weak var delegate: BackButtonDelegate?

    /// ratios from original design
    private enum UIAspectRatio {
        static let imageViewHeightToScreenHeight: CGFloat = 0.6
    }

    // MARK: - @IBOutlets

    @IBOutlet private weak var gradientLayerView: UIView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var lectureNameLabel: UILabel!
    @IBOutlet private weak var lectureImageView: UIImageView!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var segmentedControlHeightConstraint: NSLayoutConstraint!

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

private extension LectureHeaderCollectionViewCell {

    func setup() {
        setupSegmentedControl()
        setupGradientLayer()
        setupAspectRatio()
    }

    // methods set's up auto layout constraint accordingly to aspect ratios from original design
    func setupAspectRatio() {

        lectureImageView.translatesAutoresizingMaskIntoConstraints = false

        lectureImageView.constraints.forEach {
            print($0)
        }

        imageViewHeightConstraint.constant = UIScreen.main.bounds.height * UIAspectRatio.imageViewHeightToScreenHeight

        print("-------")

        lectureImageView.constraints.forEach {
            print($0)
        }
        print("---------------------------------------------- \n \n \n \n \n")
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
}