//
//  UIColor+TappableClear.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2019-06-02.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIColor {

    /**
     This color can be used by views and buttons that should
     have a clear background color and still be tappable. It
     is an alternative to using `.clear`, which makes a view
     stop registering touches.
     */
    static var clearTappable: UIColor {
        return UIColor(white: 1, alpha: 0.01)
    }
}
