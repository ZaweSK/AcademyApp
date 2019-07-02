//
//  LectureDetailViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 02/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class LectureDetailViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    @IBOutlet weak var attendanceSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSwitch()
        setupSegmentedControl()
        // Do any additional setup after loading the view.
    }

    func setupSwitch() {
        attendanceSwitch.onTintColor = .pinkishRed
        attendanceSwitch.tintColor = .black10
        attendanceSwitch.backgroundColor = .greyishBrownTwo
        attendanceSwitch.layer.cornerRadius = attendanceSwitch.frame.height / 2
    }

    func setupSegmentedControl() {
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .pinkishRed

        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: UIFont.segmentedControlFont,
            NSAttributedString.Key.kern: 1
        ]

        segmentedControl.setTitleTextAttributes(attributes, for: .normal)
        segmentedControl.setTitleTextAttributes(attributes, for: .selected)
    }
}