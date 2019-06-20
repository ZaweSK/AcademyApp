//
//  LecturesCollectionViewCell.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 20/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class LecturesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lectureImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 7
    }
}
