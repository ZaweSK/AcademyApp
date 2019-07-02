//
//  LectureDetailViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 02/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class LectureDetailViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setupSwitch() {
        attendanceSwitch.onTintColor = .pinkishRed
        attendanceSwitch.tintColor = .black10
        attendanceSwitch.backgroundColor = .greyishBrownTwo
        attendanceSwitch.layer.cornerRadius = attendanceSwitch.frame.height / 2
    }

    func fontAttributes(controlIsSelected: Bool) -> [NSAttributedString.Key: Any] {
        let fontColor: UIColor = controlIsSelected ? .white : .pinkishRed
        let attributes: [NSAttributedString.Key: Any] =  [
            NSAttributedString.Key.foregroundColor: fontColor,
            NSAttributedString.Key.font: UIFont.segmentedControlFont,
            NSAttributedString.Key.kern: 1
        ]
        return attributes
    }

    func setupSegmentedControl() {
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .pinkishRed
        segmentedControl.setTitleTextAttributes(fontAttributes(controlIsSelected: false), for: .normal)
        segmentedControl.setTitleTextAttributes(fontAttributes(controlIsSelected: true), for: .selected)
    }
}
