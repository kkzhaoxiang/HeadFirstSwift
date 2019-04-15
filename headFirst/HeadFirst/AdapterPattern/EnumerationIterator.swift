//
//  EnumerationIterator.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/10.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

protocol AdapterIterator {
    associatedtype Element
    func hasNext() -> Bool
    func next() -> Element
    func remove() throws
}

protocol Enumeration {
    associatedtype Element
    func hasMoreElements() -> Bool
    func nextElement() -> Element
}

enum EnumerationIteratorError: Error {
    case removeError(errorMsg: String)
}

class EnumerationIterator<E: Enumeration>: AdapterIterator {
    typealias Element = E.Element
    var enumer: E
    
    init(with enumer: E) {
        self.enumer = enumer
    }
    
    func hasNext() -> Bool {
        return enumer.hasMoreElements()
    }
    
    func next() -> Element {
        return enumer.nextElement()
    }
    
    func remove() throws  {
        throw EnumerationIteratorError.removeError(errorMsg: "don't use remove method")
    }
}

