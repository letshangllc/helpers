//
//  NumberExtensions.swift
//  Lift Tracker
//
//  Created by Carl Burnham on 11/21/18.
//  Copyright © 2018 Carl Burnham. All rights reserved.
//

import Foundation

extension Int {
    func format(f: String) -> String {
        return String(format: "%\(f)d", self)
    }
}

extension Double {
    func format(decimals: String) -> String {
        return String(format: "%\(decimals)f", self)
    }
}
