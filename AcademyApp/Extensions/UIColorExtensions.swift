//
//  UIColor.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 13/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIColor extension for handling app specific colors

extension UIColor {

    // MARK: - Static properities
    /// app specific colors received in original design

    static var almostBlack: UIColor {
        return UIColor(red: 17, green: 21, blue: 23)
    }

    static var brownGray: UIColor {
        return UIColor(red: 128, green: 128, blue: 128)
    }

    static var blackish: UIColor {
        return UIColor(red: 51, green: 51, blue: 51)
    }

    static var greyishBrown: UIColor {
        return UIColor(red: 64, green: 64, blue: 64)
    }

    static var greyishBrownTwo: UIColor {
        return UIColor(red: 72, green: 72, blue: 72)
    }

    static var pinkishRed: UIColor {
        return UIColor(red: 239, green: 13, blue: 51)
    }

    static var black10: UIColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
    }

    static var black50: UIColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }

    static var black90: UIColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.9)
    }

    static var black0: CGColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
    }

    static var black80: CGColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.8).cgColor
    }
}


// MARK: - Convenience initializers

extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        let redValue = red / 255
        let greenValue = green / 255
        let blueValue = blue / 255

        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
}
