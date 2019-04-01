//
//  Whip.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/1.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class Whip: CondimentDecorator {
    
    var beverage: Beverage
    
    init(with beverage: Beverage) {
        self.beverage = beverage
        super.init()
    }
    
    override func cost() -> Float {
        return 0.10 + beverage.cost()
    }
    
    override func getDesc() -> String {
        return beverage.desc + "Whip"
    }
}
