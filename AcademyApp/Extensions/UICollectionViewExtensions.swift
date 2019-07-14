//
//  UICollectionViewExtension.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 21/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UICollectionView extension

extension UICollectionView {

    // Method registers a cell for collectionView with it's nib name. Registered cell
    // must conform to NibLoadableView protocol.

    func register<T: UICollectionViewCell>(_: T.Type) where T: NibLoadable {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)

        register(nib, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }

    // Method deques a reusable cell for collectionView. Cell's nib name is used as a reuse
    // identifier. Cell must conform to NibLoadableView protocol.

    func dequeReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: NibLoadable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not deque cell with identifier \(T.defaultReuseIdentifier)")
        }
        return cell
    }
}
