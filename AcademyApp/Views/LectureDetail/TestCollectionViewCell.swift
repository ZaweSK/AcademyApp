//
//  TestCollectionViewCell.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 03/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell, NibLoadableView {

    @IBOutlet private weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var containerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.width
        widthConstraint.constant = screenWidth
    }

}
