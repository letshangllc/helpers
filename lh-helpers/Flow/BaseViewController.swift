//
//  BaseViewController.swift
//  lh-helpers
//
//  Created by Carl Burnham on 7/28/19.
//  Copyright © 2019 Carl Burnham. All rights reserved.
//

import Foundation

public protocol BaseViewController: UIViewController {
    
    associatedtype BaseViewModel
    
    var viewModel: BaseViewModel! { get set }
    static var storyboardName: String { get }
    static var viewControllerIdentifier: String { get }
}

public extension BaseViewController {
    
    static func viewController<T: BaseViewController>(viewModel: BaseViewModel) -> T {
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: viewControllerIdentifier) as! T
        
        vc.viewModel = viewModel as? T.BaseViewModel
        
        return vc
    }
}
