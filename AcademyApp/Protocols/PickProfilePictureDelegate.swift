//
//  PickProfilePictureDelegate.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 19/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation

// Delegate for view implemented in separate file.

protocol PickProfilePictureDelegate: class {

    // Method lets viewController know that user is trying to pick profile picture
    func pickProfilePicture()
}
