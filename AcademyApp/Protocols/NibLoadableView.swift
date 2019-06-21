//
//  NibLoadableView.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 21/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit

protocol NibLoadableView: class {
    static var nibName: String { get }
    static var defaultReuseIdentifier: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }

    static var defaultReuseIdentifier: String {
        return nibName
    }

}
