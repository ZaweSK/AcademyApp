//
//  UIScrollViewExtensions.swift
//  AcademyApp
//
//  Created by Peter Sevcik on 18/06/2019.
//  Copyright © 2019 Peter Sevcik. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {

    enum ScrollDirection {
        case bottom
        case top
    }

    // Method calculates offset used to scroll to one of ScrollView's edges

    private func contentOffset(to direction: ScrollDirection) -> CGPoint {

        var contentOffset = CGPoint.zero

        switch direction {

        case .bottom:
            contentOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        case .top:
            contentOffset = CGPoint(x: 0, y: -self.contentInset.top)
        }

        return contentOffset
    }

    // Method scrolls to the edge of scrollView specified by the direction (top/bottom etc)

    func scrollTo(direction: ScrollDirection, animated: Bool = true) {
        setContentOffset(self.contentOffset(to: direction), animated: animated)
    }
}
