//
//  UITableViewExtensions.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 29/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UITableView extension
/// Extension of UITableView's cell/header registering & dequeing. 
/// Extension is counting on cells/headers to conform to NibLoadable protocol.

extension UITableView {

    // Method registers a cell for tableView with it's nib name. Registered cell
    // must conform to NibLoadableView protocol.

    func registerCell<T: UITableViewCell>(_: T.Type) where T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)

        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }

    // Method deques a reusable cell for tableView. Cell's nib name is used as a reuse
    // identifier. Cell must conform to NibLoadableView protocol.

    func dequeReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: NibLoadableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not deque cell with identifier \(T.defaultReuseIdentifier)")
        }
        return cell
    }

    // Method registers a header for tableView with it's nib name. Registered headerView
    // must conform to NibLoadableView protocol.

    func registerHeader<T: UITableViewHeaderFooterView>(_: T.Type) where T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)

        register(nib, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
    }


    // Method deques a reusable header/footer for tableView. Header's nib name is used as a reuse
    // identifier. Cell must conform to NibLoadableView protocol.

    func dequeReusableHeader<T: UITableViewHeaderFooterView>() -> T where T: NibLoadableView {
        guard let header = dequeueReusableHeaderFooterView(withIdentifier: T.defaultReuseIdentifier) as? T else {
            fatalError("Could not deque header with identifier \(T.defaultReuseIdentifier)")
        }
        return header
    }
}
