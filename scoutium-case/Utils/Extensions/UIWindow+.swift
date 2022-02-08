//
//  UIWindow+.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 7.02.2022.
//

import Foundation
import UIKit

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
