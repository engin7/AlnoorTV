//
//  UIApplicationExtension.swift
//  AlnoorTV
//
//  Created by Onur Yıldırım on 17.10.2019.
//  Copyright © 2019 Teknoloji. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    static func topViewController(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        
        return base
    }
    
}
