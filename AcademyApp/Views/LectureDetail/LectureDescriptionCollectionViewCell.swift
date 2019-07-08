//
//  LectureDescriptionCollectionViewCell.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 03/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class LectureDescriptionCollectionViewCell: UICollectionViewCell, NibLoadableView {

    // MARK: - @IBOutlets

    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!

    // MARK: - LifeCycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    // needs to be implemented in order for autoresizing of cell to work correctly
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutAttributes.bounds.size.width = UIScreen.main.bounds.width
        descriptionLabel.preferredMaxLayoutWidth = layoutAttributes.size.width - contentView.layoutMargins.left - contentView.layoutMargins.right
        layoutAttributes.bounds.size.height = containerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return layoutAttributes
    }
}

// MARK: - Private setup methods

private extension LectureDescriptionCollectionViewCell {

    func setup() {
        containerView.backgroundColor = .almostBlack
        setupDescriptionLabel()
    }

    func setupDescriptionLabel() {
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont.MaisonNeue.medium(13)
        descriptionLabel.text = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
        incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
        fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
        officia deserunt mollit anim id est laborum.
        """
        descriptionLabel.setLineHeight(lineHeight: 12)
    }
}
