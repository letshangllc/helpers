//
//  Collection+Extensions.swift
//  lh-helpers
//
//  Created by Carl Burnham on 5/16/20.
//  Copyright © 2020 Carl Burnham. All rights reserved.
//

public extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
