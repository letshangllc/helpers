//
//  NumberExtensions.swift
//  Lift Tracker
//
//  Created by Carl Burnham on 11/21/18.
//  Copyright © 2018 Carl Burnham. All rights reserved.
//

import Foundation

extension Int {
    public func format(f: String) -> String {
        return String(format: "%\(f)d", self)
    }
}

public extension Double {
    func format(decimals: String) -> String {
        return String(format: "%\(decimals)f", self)
    }
    
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
