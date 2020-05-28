//
//  DateUtils.swift
//  Lift Tracker
//
//  Created by Carl Burnham on 11/21/18.
//  Copyright © 2018 Carl Burnham. All rights reserved.
//

import Foundation

public let SLASHES_DATE_FORMAT = "MM/dd/yyyy"
public let SLASHES_DATE_FORMAT_SECONDS = "MM/dd/yyyy hh:mm:ss"
public let DISPLAY_MONTH_DAY_YEAR_FORMAT = "MMM dd, yyyy"
public let DASHES_DATE_FORMAT = "dd-MM-yyyy"

extension Date {
    
    public func getDateString(dateFormat: String = SLASHES_DATE_FORMAT) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: self)
    }
    
    public func getDisplayString() -> String {
        return getDateString(dateFormat: DISPLAY_MONTH_DAY_YEAR_FORMAT)
    }
    
    public func getDashesDateString() -> String {
        return getDateString(dateFormat: DASHES_DATE_FORMAT)
    }
    
    public var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
    public var dayIndexOfWeek: Int {
        let myCalendar = Calendar(identifier: .gregorian)
        return myCalendar.component(.weekday, from: self) - 1
    }
    
    public var month: Int {
        let myCalendar = Calendar(identifier: .gregorian)
        return myCalendar.component(.month, from: self)
    }
    
    public var dayOfMonth: Int {
        let myCalendar = Calendar(identifier: .gregorian)
        return myCalendar.component(.day, from: self)
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
}
