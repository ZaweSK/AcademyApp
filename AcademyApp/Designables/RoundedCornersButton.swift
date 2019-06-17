//
//  UIButtonX.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 14/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

@IBDesignable
final class RoundedCornersButton: UIButton {

    @IBInspectable
    var cornerRadius : CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    var disabledColor = UIColor.greyishBrown
    var enabledColor = UIColor.pinkishRed
    
    override var isEnabled: Bool {
        didSet {
            self.backgroundColor = self.isEnabled ? enabledColor : disabledColor
        }
    }
}
