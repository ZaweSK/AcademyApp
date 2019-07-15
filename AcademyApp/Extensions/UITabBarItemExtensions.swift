//
//  UITabBarItemExtensions.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 19/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Extension of TabBarItem UI setup process

extension UITabBarItem {

    // Sets images for tabBaritem's states: selected & unselected
    func setImages(selectedImage: UIImage, unselectedImage: UIImage) {
        self.selectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
        self.image = unselectedImage.withRenderingMode(.alwaysOriginal)
    }
}
