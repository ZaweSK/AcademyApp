//
//  ViewWrapping.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 15/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


// MARK: - ViewWrapping Protocol declaration
/// Serves as a wrapper around views designed in xib file

protocol ViewWrapping {
    func wrap(_ view: UIView)
}

// MARK: - Extension of ViewWrapping. Add wrapping functionality

extension ViewWrapping where Self: UIView {

    // Method Wraps view.
    /// 1. add view as a subview
    /// 2. apply autolayout constraint to subview
    func wrap(_ view: UIView) {
        self.addSubview(view)

        view.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
        }
    }
}
