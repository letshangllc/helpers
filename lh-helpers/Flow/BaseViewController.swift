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
    associatedtype FlowDelegate
    
    var viewModel: BaseViewModel! { get set }
    var flowDelegate: FlowDelegate? { get set }
    
    static var storyboardName: String { get }
    static var viewControllerIdentifier: String { get }
}

public extension BaseViewController {
    
    static var viewControllerIdentifier: String {
        return String(describing: self)
    }
    
    static func viewController(viewModel: BaseViewModel, flowDelegate: FlowDelegate? = nil) -> Self {
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: Self.self))
        let vc = storyBoard.instantiateViewController(withIdentifier: viewControllerIdentifier) as! Self
        
        vc.viewModel = viewModel
        vc.flowDelegate = flowDelegate
        return vc
    }
}
