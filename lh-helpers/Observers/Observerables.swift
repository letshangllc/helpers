//
//  Observerables.swift
//  lh-helpers
//
//  Created by Carl Burnham on 12/3/18.
//  Copyright © 2018 Carl Burnham. All rights reserved.
//

// Adapted from: https://five.agency/solving-the-binding-problem-with-swift/
import Foundation

class Observable<T> {
    var value: T {
        didSet {
            for bondBox in bonds {
                bondBox.bond?.valueChanged(value)
            }
        }
    }
    
    var bonds: [BondBox<T>] = []
    
    init(_ v: T) {
        value = v
    }
}

// Put the observation callback in a Bond so it is not part of the model and does no exist when the view does not exist
class Bond<T> {
    var valueChanged: (T) -> ()
    
    init(_ valueChanged: @escaping (T) -> ()) {
        self.valueChanged = valueChanged
    }
    
    func bind(observable: Observable<T>) {
        observable.bonds.append(BondBox(self))
    }
}

class BondBox<T> {
    weak var bond: Bond<T>?
    init(_ b: Bond<T>) { bond = b }
}
