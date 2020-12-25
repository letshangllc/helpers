//
//  ViewControllerExtension.swift
//  Lift Tracker
//
//  Created by Carl Burnham on 11/23/18.
//  Copyright © 2018 Carl Burnham. All rights reserved.
//

import UIKit

// Put this piece of code anywhere you like
public extension UIViewController {
    @discardableResult func showActivityIndicator() -> UIView {
        let container = UIView()
        container.accessibilityIdentifier = "viewActivityIndicator"
        let loadingView = UIView()
        let activityIndicator = UIActivityIndicatorView()
        
        container.frame = view.frame
        container.center = view.center
        container.backgroundColor = UIColor(rgb: 0xffffff).withAlphaComponent(0.9)
        
        loadingView.frame = CGRect(origin: .zero, size: CGSize(width: 80, height: 80))
        loadingView.center = view.center
        loadingView.backgroundColor = UIColor(rgb: 0x444444).withAlphaComponent(0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(origin: .zero, size: CGSize(width: 40, height: 40))
        activityIndicator.style = .large
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);
        activityIndicator.hidesWhenStopped = true;
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        view.addSubview(container)
        activityIndicator.startAnimating()
        return container
    }
    
    func removeActivityIndicator() {
        view.subviews.first(where: { $0.accessibilityIdentifier == "viewActivityIndicator" })?.removeFromSuperview()
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    /* call function on Vc bbefore you push on top of it */
    func setBackButtonName() {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
    }
    
    // Starting with a parent controller, add or replace child view controller
    func transition(to newChild: UIViewController) {
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

    /// Add a child view controller to a container view within self
    /// - Parameters:
    ///   - childViewController: view controller to add to as child
    ///   - containerView: view in which to put view controller
    func addChildViewControllerToContainer(_ childViewController: UIViewController, containerView: UIView) {
        addChild(childViewController)

        containerView.addSubview(childViewController.view)
        childViewController.view.frame = containerView.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        childViewController.didMove(toParent: self)
    }
}
