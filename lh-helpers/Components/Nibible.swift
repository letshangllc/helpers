//
//  Nibible.swift
//  lh-helpers
//
//  Created by Carl Burnham on 4/19/20.
//  Copyright © 2020 Carl Burnham. All rights reserved.
//

import Foundation

public protocol Nibible: UIView {
    func loadViewFromNib() -> UIView?
}

public extension Nibible {
    func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let selfType = type(of: self)
        let nib = UINib(nibName: String(describing: selfType), bundle: Bundle(for: selfType))
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
