//
//  TextFieldX.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 13/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable
class TextFieldX: UITextField {

    @IBInspectable
    var borderWidth : CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    
    override func awakeFromNib() {
        self.borderStyle = .none
        self.addBorders(edges: .bottom, color: .lightGray, inset: 0, thickness: 0.8)
        
        
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: self.frame.height ))
        imageView.contentMode = .scaleAspectFit
        
        imageView.tintColor = UIColor.lightGray
        imageView.image = UIImage(named: "envelope")
       
        self.leftView = imageView
        self.leftViewMode = .always
        
    }
}
