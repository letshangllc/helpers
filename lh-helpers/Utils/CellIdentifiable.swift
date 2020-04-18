//
//  CellIdentifiable.swift
//  lh-helpers
//
//  Created by Carl Burnham on 4/10/20.
//  Copyright © 2020 Carl Burnham. All rights reserved.
//

public protocol CellIdentifiable {
    static var identifier: String { get }
}

public extension CellIdentifiable {
    static var identifier: String { return String(describing: self) }
}
