//
//  NibLoadableView.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 21/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit

// MARK: - NibLoadableView protocol

protocol NibLoadable: class {
    static var nibName: String { get }
    static var defaultReuseIdentifier: String { get }
}

extension NibLoadable where Self: UIView {

    // Static methods which return the name of the xib file - name. This name serves as a
    // cell identifier later on.

    static var nibName: String {
        return String(describing: self)
    }

    static var defaultReuseIdentifier: String {
        return nibName
    }

    static var nib: UINib {
        return UINib(nibName: nibName, bundle: nil)
    }

    static func loadFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("The nib \(nib) expected its root view to be of type \(self)")
        }
        return view
    }

}
