//
//  Observerables.swift
//  lh-helpers
//
//  Created by Carl Burnham on 12/3/18.
//  Copyright © 2018 Carl Burnham. All rights reserved.
//

// Adapted from: https://five.agency/solving-the-binding-problem-with-swift/
import Foundation

public class Observable<T> {
    public var value: T {
        didSet {
            for bondBox in bonds {
                DispatchQueue.main.async {
                    bondBox.bond?.valueChanged(self.value)
                }
            }
        }
    }
    
    var bonds: [BondBox<T>] = []
    
    public init(_ v: T) {
        value = v
    }
}

// Put the observation callback in a Bond so it is not part of the model and does no exist when the view does not exist
public class Bond<T> {
    public var valueChanged: (T) -> ()
    
    public init(valueChanged: @escaping (T) -> ()) {
        self.valueChanged = valueChanged
    }
    
    public func bind(observable: Observable<T>) {
        observable.bonds.append(BondBox(self))
    }
}

public class BondBox<T> {
    weak var bond: Bond<T>?
    init(_ b: Bond<T>) { bond = b }
}
