//
//  UIColor.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 13/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static var almostBlack : UIColor  {
        return UIColor(r: 17, g: 21, b: 23)
    }
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat){
        let redValue = r / 255
        let greenValue = g / 255
        let blueValue = b / 255
        
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
}

