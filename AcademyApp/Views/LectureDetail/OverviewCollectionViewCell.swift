//
//  OverviewCollectionViewCell.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 02/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class OverviewCollectionViewCell: UICollectionViewCell, NibLoadableView {

    // MARK: - @IBOutlets

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var lectureNameLabel: UILabel!
    @IBOutlet private weak var lectureImageView: UIImageView!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!

    // MARK: - LifeCycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}

// MAKR: - Private setup methods

private extension OverviewCollectionViewCell {

    func setup() {
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.width
        widthConstraint.constant = screenWidth
        heightConstraint.constant = 400


        setupSegmentedControl()
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
}
