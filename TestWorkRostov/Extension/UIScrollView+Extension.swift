//
//  UIScrollView+Extension.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 17.07.2021.
//

import UIKit

extension UIScrollView {
    var isOverflowVertical: Bool {
        return self.contentSize.height > self.frame.height && self.frame.height > 0
    }
    
    func isReachedBottom(withTolerance tolerance: CGFloat = 0) -> Bool {
        guard self.isOverflowVertical else { return false }
        let contentOffsetBottom = self.contentOffset.y + self.frame.height
        return contentOffsetBottom >= self.contentSize.height - tolerance
    }
}
