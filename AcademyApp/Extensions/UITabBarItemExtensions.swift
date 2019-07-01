//
//  UITabBarItemExtensions.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 19/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit

extension UITabBarItem {

    // Sets images for tabBaritem's states: selected & unselected
    func setImages(selectedImageName: String, unselectedImageName: String) {
        self.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        self.image = UIImage(named: unselectedImageName)?.withRenderingMode(.alwaysOriginal)
    }
}
