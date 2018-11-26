//
//  DateUtils.swift
//  Lift Tracker
//
//  Created by Carl Burnham on 11/21/18.
//  Copyright © 2018 Carl Burnham. All rights reserved.
//

import Foundation

extension Date {
    func getDisplayString() -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        return dateFormatterPrint.string(from: self)
    }
    
    func getServerDateString() -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd-MM-yyyy"
        return dateFormatterPrint.string(from: self)
    }
}
