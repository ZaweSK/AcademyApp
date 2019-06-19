//
//  TabBarViewController.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 19/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

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
        fontSetup()
        tabBarItemsPicturesSetup()

        tabBar.sizeThatFits( CGSize.zero)
    }

    func colorSetup() {
        tabBar.barTintColor = UIColor.almostBlack
        tabBar.unselectedItemTintColor = UIColor.brownGray
    }

    func fontAttributes(tabIsSelected: Bool) -> [NSAttributedString.Key: Any] {
        let fontColor = tabIsSelected ? UIColor.white : UIColor.brownGray
        let attributes: [NSAttributedString.Key: Any] =  [
            NSAttributedString.Key.foregroundColor: fontColor,
            NSAttributedString.Key.font: UIFont.tabBarFont,
            NSAttributedString.Key.kern: 0.5
        ]
        return attributes
    }

    func fontSetup() {
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes(tabIsSelected: true), for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes(tabIsSelected: false), for: .normal)
    }

    func tabBarItemsPicturesSetup() {

        guard let lecturesTabBarItem = lecturesTabBarItem, let profileTabBarItem = profileTabBarItem else {
            return
        }

        lecturesTabBarItem.setImages(selectedImageName: "components", unselectedImageName: "components_unselected")
        profileTabBarItem.setImages(selectedImageName: "profileCircle", unselectedImageName: "profileCircle_unselected")
    }

}




