//
//  DarkRoast.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/1.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class DarkRoast: Beverage {
    
    override init() {
        super.init()
        desc = "DarkRoast"
    }
    
    override func cost() -> Float {
        return 0.99
    }
}
