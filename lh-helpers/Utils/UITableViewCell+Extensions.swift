//
//  UITableViewCell+Extensions.swift
//  lh-helpers
//
//  Created by Carl Burnham on 5/16/20.
//  Copyright © 2020 Carl Burnham. All rights reserved.
//

import UIKit

public protocol BaseTableViewCell: UITableViewCell {
    associatedtype CellViewModel
    func setContent(cellContent: CellViewModel)
}

public extension BaseTableViewCell {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}
