//
//  ViewControllerExtension.swift
//  Lift Tracker
//
//  Created by Carl Burnham on 11/23/18.
//  Copyright © 2018 Carl Burnham. All rights reserved.
//

import UIKit

// Put this piece of code anywhere you like
extension UIViewController {
    public func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    /* call function on Vc bbefore you push on top of it */
    public func setBackButtonName() {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
    }
}
