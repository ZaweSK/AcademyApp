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

    // Method adds spacing attributed to NSMutableAttributedString
    func setLineHeight(lineHeight: CGFloat) {

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight

        self.addAttribute(.paragraphStyle,
                          value: paragraphStyle,
                          range: NSRange(location: 0, length: self.length))
    }
}


extension NSAttributedString {

//    func update(to text: String) {
//        let attributes = self.attributes(at: 0, effectiveRange: nil)
//        let new = NSAttributedString(string: text, attributes: attributes)
//        self = new
//    }
}
