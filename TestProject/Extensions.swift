//
//  Extensions.swift
//  TestProject
//
//  Created by Ljubisa Katana on 2/14/19.
//  Copyright © 2019 Ljubisa Katana. All rights reserved.
//

import UIKit

extension UIViewController {
    var guide: UILayoutGuide {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide
        } else {
            return view.layoutMarginsGuide
        }
    }
}

extension UINavigationItem {
    func searchBarButtonItem(button: UIButton) {
        let barButton = UIBarButtonItem(customView: button)
        self.rightBarButtonItem = barButton
    }
}

/// cofigure placeholder with extension
//extension UITextField{
//    @IBInspectable var placeHolderColor: UIColor? {
//        get {
//            return self.placeHolderColor
//        }
//        set {
//            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
//        }
//    }
//}
