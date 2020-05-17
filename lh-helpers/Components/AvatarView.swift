//
//  AvatarView.swift
//  lh-helpers
//
//  Created by Carl Burnham on 5/17/20.
//  Copyright © 2020 Carl Burnham. All rights reserved.
//

import UIKit

public struct AvatarViewModel {
    let initials: String
    let image: UIImage?
    
    public init(initials: String, image: UIImage?) {
        self.initials = initials
        self.image = image
    }
}

public class AvatarView: UIView {
    
    var label: UILabel
    var imageView: UIImageView
    
    public override init(frame: CGRect) {
        label = UILabel(frame: frame)
        imageView = UIImageView(frame: frame)
        
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        label = UILabel()
        imageView = UIImageView()
        
        super.init(coder: coder)
    }
    
    public func setContent(viewModel: AvatarViewModel) {
        if let image = viewModel.image {
            imageView.image = image
        } else {
            label.text = viewModel.initials
            label.backgroundColor = .systemGray4
            label.textAlignment = .center
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
        }
        addSubview(imageView)
        addSubview(label)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = self.frame.size.width/2
        clipsToBounds = true
        
        label.frame = bounds
        imageView.frame = bounds
    }
}
