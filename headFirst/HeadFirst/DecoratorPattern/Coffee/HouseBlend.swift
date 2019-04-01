//
//  HouseBlend.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/1.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class HouseBlend: Beverage {
    
    override init() {
        super.init()
        desc = "HouseBlend"
    }
    
    override func cost() -> Float {
        return 0.89
    }
}


