//
//  FontSyler.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 05/07/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit

// Enum representig different app specific elements which have font property. These are then used in FrontSyler.

enum AppElement {
    case textFieldPlaceholder
    case showButton
    case doneButtonTitle
    case tabBar
    case lecturesLabel
    case lectureHeaderCellLectureNameLabel
    case lectureTableViewCellLectureNameLabel
    case segmentedControl
    case attendedLabel
    case lectureDescriptionLabel
}

// Static enum for setting fonts to different elements in app

enum FontStyler {

    static func font(for appElement: AppElement) -> UIFont {

        switch appElement {

        case .textFieldPlaceholder:
            return UIFont.MaisonNeue.medium(16)

        case .showButton:
            return UIFont.MaisonNeue.demi(13)

        case .doneButtonTitle:
            return UIFont.MaisonNeue.medium(16)

        case .tabBar:
            return UIFont.MaisonNeue.medium(10)

        case .lecturesLabel:
            return UIFont.MaisonNeue.bold(13)

        case .lectureHeaderCellLectureNameLabel:
            return UIFont.TrumpGothic.bold(52)

        case .lectureTableViewCellLectureNameLabel:
            return UIFont.TrumpGothic.bold(32)

        case .attendedLabel:
            return UIFont.MaisonNeue.medium(16)

        case .lectureDescriptionLabel:
            return UIFont.MaisonNeue.medium(13)

        case .segmentedControl:
            return UIFont.MaisonNeue.medium(13)
        }
    }
}
