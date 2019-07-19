//
//  NSMuttableAttributedStringExtensions.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 15/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit


extension NSMutableAttributedString {

    /// Method adds spacing attributed to NSMutableAttributedString
    func setLineHeight(lineHeight: CGFloat) {

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight

        self.addAttribute(.paragraphStyle,
                          value: paragraphStyle,
                          range: NSRange(location: 0, length: self.length))
    }
}
