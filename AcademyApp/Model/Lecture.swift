//
//  MockData.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 28/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit

struct Lecture {
    var lectureName: String = ""
    var lectureCellImage: UIImage

    init(lectureName: String, lectureCellImage: UIImage) {
        self.lectureName = lectureName
        self.lectureCellImage = lectureCellImage
    }
}
