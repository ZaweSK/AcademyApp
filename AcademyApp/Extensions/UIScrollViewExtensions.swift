//
//  UIScrollViewExtensions.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 18/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit

enum ScrollDirection {

    case bottom
    case top

    fileprivate func contentOffset(with scrollView: UIScrollView) -> CGPoint {

        var contentOffset = CGPoint.zero

        switch self {

        case .bottom:
            contentOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height)
        case .top:
            contentOffset = CGPoint(x: 0, y: -scrollView.contentInset.top)
        }

        return contentOffset
    }
}

extension UIScrollView {

    func scrollTo(direction: ScrollDirection, animated: Bool = true) {
        self.setContentOffset(direction.contentOffset(with: self), animated: animated)
    }
}
