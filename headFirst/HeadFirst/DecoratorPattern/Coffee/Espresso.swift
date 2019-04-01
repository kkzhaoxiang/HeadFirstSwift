//
//  Espresso.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/1.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class Espresso: Beverage {
    
    override init() {
        super.init()
        desc = "Espresso"
    }
    
    override func cost() -> Float {
        return 1.99
    }
}
