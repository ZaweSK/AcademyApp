//
//  LecturesTableViewCell.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 20/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class LecturesTableViewCell: UITableViewCell {

    @IBOutlet weak var lectureImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.layer.cornerRadius = 20
        self.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
