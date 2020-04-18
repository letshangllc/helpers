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
    
    // Starting with a parent controller, add or replace child view controller
    public func transition(to newChild: UIViewController) {
        let existingChild = children.last
        addChild(newChild)
        
        guard let newChildView = newChild.view else {
            return // TODO add completion
        }
        
        newChildView.translatesAutoresizingMaskIntoConstraints = true
        newChildView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        newChildView.frame = view.bounds
        
        if let existingChild = existingChild {
            existingChild.willMove(toParent: nil)
            
            transition(from: existingChild, to: newChild, duration: 0.3, animations: nil) { _ in
                existingChild.removeFromParent()
                newChild.didMove(toParent: self)
            } // TODO add animations and completion
        } else {
            view.addSubview(newChildView)
            
            UIView.animate(withDuration: 0.3, animations: { }) { _ in
                newChild.didMove(toParent: self)
                // call completion
            }
        }
    }
}
