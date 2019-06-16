//
//  UIFont+Extensions.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 16/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit

extension UIFont
{
    static func backUpFont(size: CGFloat)->UIFont {
        return UIFont(name: "Helvetica", size: size)!
    }
    
    static var textFieldPlaceholderFont: UIFont {
        let fontName = "MaisonNeue"
        let fontSize: CGFloat = 16
        return UIFont(name: fontName, size: 16) ?? backUpFont(size: fontSize)
    }
    
    static var showLabelFont: UIFont {
        let fontName = "MaisonNeue-Demi"
        let fontSize: CGFloat = 13
        return UIFont(name: fontName, size: 13) ?? backUpFont(size: fontSize)
    }
    
    static var doneButtonTitleFont: UIFont {
        let fontName = "MaisonNeue-Medium"
        let fontSize: CGFloat = 16
        return UIFont(name: fontName, size: fontSize) ?? backUpFont(size: fontSize)
    }
}
