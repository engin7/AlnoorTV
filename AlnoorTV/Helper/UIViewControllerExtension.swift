//
//  UIViewControllerExtension.swift
//  AlnoorTV
//
//  Created by Onur Yıldırım on 12.10.2019.
//  Copyright © 2019 Teknoloji. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func toolBarDoneClicked () -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        doneButton.tintColor = .black
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        return toolbar
    }
    
    @objc func doneClicked () {
        view.endEditing(true)
    }
}
