//
//  LoadingButton.swift
//  lh-helpers
//
//  Created by Carl Burnham on 4/19/20.
//  Copyright © 2020 Carl Burnham. All rights reserved.
//

import UIKit

@IBDesignable public class LoadingButton: UIView, Nibible {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBInspectable var title: String = "" {
        didSet {
            button.setTitle(title, for: .normal)
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 16.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var isEnabled: Bool {
        get {
            return button.isEnabled
        }
        set {
            button?.isEnabled = newValue
            backgroundColor = newValue ? UIColor.systemBlue : UIColor.systemGray3
        }
    }
    
    public var tap: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetup()
        setup()
    }
    
    func setup() {
        button.setTitle(title, for: .normal)
        activityIndicator.isHidden = true
        layer.cornerRadius = 12
        button.addTarget(self, action: #selector(buttonTapped), for: .touchDown)
    }
    
    public func showSpinner(_ show: Bool) {
        button.isHidden = show
        activityIndicator.isHidden = !show
    }
    
    @objc func buttonTapped() {
        tap?()
    }
}
