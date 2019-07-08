//
//  NavigationViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 08/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

private extension NavigationViewController {
    func setup() {
        navigationBar.tintColor = .white

        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
    }
}
