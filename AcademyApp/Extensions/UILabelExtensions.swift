//
//  UILabelExtensions.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 03/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Extension of UILabel's UI setup

extension UILabel {

    // Method sets spacing between lines inside UILabel

    func setLineHeight(lineHeight: CGFloat) {

        guard let text = self.text else {
            return
        }

        let attributeString = NSMutableAttributedString(string: text)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight

        attributeString.addAttribute(.paragraphStyle,
                                     value: paragraphStyle,
                                     range: NSRange(location: 0, length: self.text?.count ?? 0))

        self.attributedText = attributeString
    }
}
