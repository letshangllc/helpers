//
//  StringExtenstions.swift
//  lh-helpers
//
//  Created by Carl Burnham on 11/26/18.
//  Copyright © 2018 Carl Burnham. All rights reserved.
//

import Foundation

extension String {
    public func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}