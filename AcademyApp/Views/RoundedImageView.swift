//
//  RoundedImageView.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 09/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

@IBDesignable
final class RoundedImageView: UIImageView {

    // MARK: - Inspectable properties

    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
