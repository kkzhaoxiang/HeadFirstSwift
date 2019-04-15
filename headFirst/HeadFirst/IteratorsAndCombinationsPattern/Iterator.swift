//
//  Iterator.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/15.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

protocol Iterator {
    associatedtype Element
    func hasNext() -> Bool
    func next() -> Element?
}
