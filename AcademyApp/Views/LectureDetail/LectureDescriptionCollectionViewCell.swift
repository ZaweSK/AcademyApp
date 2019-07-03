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
        descriptionLabel.font = .descriptionLabelFont
        descriptionLabel.text = """
        START fdfdf df dfd fdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfd
        fdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfd
        fdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfd
        fdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfd
        fdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfd
        fdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfdfdfdf df dfd
        END
        """
    }
}
