//
//  MyClass.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/4.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class Slingleton {
    static let shared = Slingleton()
    private init() {}
}
