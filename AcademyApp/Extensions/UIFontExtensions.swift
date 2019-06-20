//
//  UIFont+Extensions.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 16/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIFont extension for handling app specific fonts

extension UIFont {

    // MARK: - Static properities

    static var textFieldPlaceholderFont: UIFont {
        let fontName = "MaisonNeue"
        let fontSize: CGFloat = 16
        return UIFont(name: fontName, size: fontSize) ?? backUpFont(size: fontSize)
    }

    static var showLabelFont: UIFont {
        let fontName = "MaisonNeue-Demi"
        let fontSize: CGFloat = 13
        return UIFont(name: fontName, size: fontSize) ?? backUpFont(size: fontSize)
    }

    static var doneButtonTitleFont: UIFont {
        let fontName = "MaisonNeue-Medium"
        let fontSize: CGFloat = 16
        return UIFont(name: fontName, size: fontSize) ?? backUpFont(size: fontSize)
    }

    static var tabBarFont: UIFont {
        let fontName = "MaisonNeue-Medium"
        let fontSize: CGFloat = 10
        return UIFont(name: fontName, size: fontSize) ?? backUpFont(size: fontSize)
    }

    static var lecturesLabelFont: UIFont {
        let fontName = "MaisonNeue-Bold"
        let fontSize: CGFloat = 13
        return UIFont(name: fontName, size: fontSize) ?? backUpFont(size: fontSize)
    }

    static var lectureNameFont: UIFont {
        let fontName = "TrumpGothicEast-Bold"
        let fontSize: CGFloat = 30
        return UIFont(name: fontName, size: fontSize) ?? backUpFont(size: fontSize)
    }

    // MARK: - Static methods

    static func backUpFont(size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica", size: size)!

    }
}
