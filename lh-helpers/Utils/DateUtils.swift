//
//  DateUtils.swift
//  Lift Tracker
//
//  Created by Carl Burnham on 11/21/18.
//  Copyright © 2018 Carl Burnham. All rights reserved.
//

import Foundation

extension Date {
    public func getDisplayString() -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        return dateFormatterPrint.string(from: self)
    }
    
    public func getServerDateString() -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd-MM-yyyy"
        return dateFormatterPrint.string(from: self)
    }
    
    public var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
    public var dayIndexOfWeek: Int {
        let myCalendar = Calendar(identifier: .gregorian)
        return myCalendar.component(.weekday, from: self) - 1
    }
    
    public var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    public var nextWeek: Date {
        return Calendar.current.date(byAdding: .day, value: 7, to: self)!
    }
    
    public func getFutureDate(daysAhead: Int) -> Date{
        return Calendar.current.date(byAdding: .day, value: daysAhead, to: self)!
    }
    
    public func isBetweeen(startDate: Date, endDate: Date) -> Bool {
        return startDate.compare(self) == self.compare(endDate)
    }
    
    /* Get today based on the users time zone */
    public var today: Date {
        var today = Date()
        let secondsDiff: Int = TimeZone.current.secondsFromGMT()
        today = today.addingTimeInterval(Double(secondsDiff))
        return today
    }
}
