//
//  UIButtonX.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 14/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

// MARK: - Button with rounded corners, designable in storyboard

@IBDesignable
final class RoundedCornersButton: UIButton {

    // MARK: - Stored properities

    private var disabledColor = UIColor.greyishBrown
    private var enabledColor = UIColor.pinkishRed

    override var isEnabled: Bool {
        didSet {
            self.backgroundColor = self.isEnabled ? enabledColor : disabledColor
        }
    }

    // MARK: - Inspectable properties

    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
