//
//  LecturesTableViewHeader.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 30/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class LecturesTableViewHeader: UITableViewHeaderFooterView, NibLoadableView {

    @IBOutlet private weak var lecturesLabel: UILabel!
    @IBOutlet private weak var headerContentView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    var headerHeight: CGFloat {
        return headerContentView.frame.height
    }
}

private extension LecturesTableViewHeader {
    func setup() {
        headerContentView.backgroundColor = .almostBlack
        setupLecturesLabel()

        // TODO: Set headerView height to intrinsic size of label
//        lecturesLabel.sizeToFit()
//        self.frame.size.height = lecturesLabel.frame.height
    }

    func setupLecturesLabel() {
        lecturesLabel.attributedText = NSAttributedString(string: lecturesLabel.text ?? "LECTURES", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.brownGray,
            NSAttributedString.Key.kern: 1,
            NSAttributedString.Key.font: UIFont.lecturesLabelFont
            ])
    }
}
