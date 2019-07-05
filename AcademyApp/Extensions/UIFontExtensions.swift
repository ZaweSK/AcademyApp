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
// swiftlint:disable force_unwrapping

extension UIFont {

    // MARK: - Static properities

    enum MaisonNeue {
        static func medium(_ size: CGFloat) -> UIFont {
            return UIFont(name: "MaisonNeue-Medium", size: size)!
        }

        static func demi(_ size: CGFloat) -> UIFont {
            return UIFont(name: "MaisonNeue-Demi", size: size)!
        }

        static func bold(_ size: CGFloat) -> UIFont {
            return UIFont(name: "MaisonNeue-Bold", size: size)!
        }
    }


    enum TrumpGothic {
        static func bold(_ size: CGFloat) -> UIFont {
            return UIFont(name: "TrumpGothicEast-Bold", size: size)!
        }
    }
}
