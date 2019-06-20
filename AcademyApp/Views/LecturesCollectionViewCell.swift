//
//  LecturesCollectionViewCell.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 20/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class LecturesCollectionViewCell: UICollectionViewCell {

    var lectureName: String?

    @IBOutlet weak var lectureImageView: UIImageView!
    @IBOutlet weak var lectureNameLabel: UILabel!
    @IBOutlet weak var checkMarkImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 7

        setupLabel()

        

        lectureNameLabel.constraints.forEach {
            print($0)
        }
    }

}

private extension LecturesCollectionViewCell {

    func setupLabel() {

        let attributedLectureName = NSAttributedString(string: lectureName ?? "LECTURE", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.lectureNameTextColor,
            NSAttributedString.Key.font: UIFont.lectureNameFont,
            NSAttributedString.Key.kern: 0
            ])

        lectureNameLabel.attributedText = attributedLectureName
    }
}
