//
//  MockData.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 28/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit

enum MockData {

    static func lectures() -> [Lecture] {
        let mockCellImageName = "mockCellImage"

        guard let mockLectureCellImage = UIImage(named: mockCellImageName) else {
            fatalError("Cannot locate mock image with name :  \(mockCellImageName)")
        }

        let lectureNames = [
            "SWIFT I (PLAYGROUND)",
            "XCODE (PROJECT)",
            "BASIC UI KIT",
            "INTERMEDIATE UI KIT",
            "ADVANCED UI KIT",
            "APP ARCHITECTURE AND LIFE CYCLE",
            "SWIFT II",
            "NETWORK & PERSISTENCE",
            "CORE GRAPHICS AND ANIMATIONS",
            "ASYNCHRONICITY & TESTING"
        ]

        return lectureNames.map { name in
            Lecture(lectureName: name, lectureCellImage: mockLectureCellImage)
        }
    }
}
