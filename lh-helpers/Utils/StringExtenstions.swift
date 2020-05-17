//
//  StringExtenstions.swift
//  lh-helpers
//
//  Created by Carl Burnham on 11/26/18.
//  Copyright © 2018 Carl Burnham. All rights reserved.
//

import Foundation

public extension String {
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, count) ..< count]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(count, r.lowerBound)),
                                            upper: min(count, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
