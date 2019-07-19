//
//  NSAttributedStringExtensions.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 19/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation

extension NSAttributedString {

    /// Returns AttibutedString with updated text but same attriubutes
    func update(to text: String) -> NSAttributedString {
        let attributes = self.attributes(at: 0, effectiveRange: nil)
        let new = NSAttributedString(string: text, attributes: attributes)
        return new
    }
}
