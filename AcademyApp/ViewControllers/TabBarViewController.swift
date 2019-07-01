//
//  TabBarViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 19/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

final class TabBarViewController: UITabBarController {

    var lecturesTabBarItem: UITabBarItem? {
        return tabBar.items?[0]
    }

    var profileTabBarItem: UITabBarItem? {
        return tabBar.items?[1]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

// MARK: - UI Setup Methods

private extension TabBarViewController {

    func setup() {
        colorSetup()
        shadowSetup()
        fontSetup()
        tabBarItemsPicturesSetup()
    }

    func colorSetup() {
        tabBar.isTranslucent = false

        tabBar.barTintColor = .almostBlack
        tabBar.unselectedItemTintColor = .brownGray
    }

    func shadowSetup() {
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -2)
        tabBar.layer.shadowRadius = 10
        tabBar.layer.shadowColor = UIColor.black50.cgColor
        tabBar.layer.shadowOpacity = 1
        tabBar.layer.masksToBounds = false
    }

    func fontAttributes(tabIsSelected: Bool) -> [NSAttributedString.Key: Any] {
        let fontColor: UIColor = tabIsSelected ? .white : .brownGray
        let attributes: [NSAttributedString.Key: Any] =  [
            NSAttributedString.Key.foregroundColor: fontColor,
            NSAttributedString.Key.font: UIFont.tabBarFont,
            NSAttributedString.Key.kern: 0.5
        ]
        return attributes
    }

    func fontSetup() {
        guard let tabBarItems = tabBar.items else {
            return
        }

        tabBarItems.forEach {
            $0.setTitleTextAttributes(fontAttributes(tabIsSelected: true), for: .selected)
            $0.setTitleTextAttributes(fontAttributes(tabIsSelected: false), for: .normal)
        }
    }

    func tabBarItemsPicturesSetup() {
        guard let lecturesTabBarItem = lecturesTabBarItem,
            let profileTabBarItem = profileTabBarItem else {
            return
        }
        lecturesTabBarItem.setImages(selectedImageName: "components", unselectedImageName: "components_unselected")
        profileTabBarItem.setImages(selectedImageName: "profileCircle", unselectedImageName: "profileCircle_unselected")
    }
}
