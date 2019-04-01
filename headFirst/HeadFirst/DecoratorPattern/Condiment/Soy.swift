//
//  Soy.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/1.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class Soy: CondimentDecorator {
    
    var beverage: Beverage
    
    init(with beverage: Beverage) {
        self.beverage = beverage
        super.init()
    }
    
    override func cost() -> Float {
        var cost = beverage.cost()
        
        if size == Beverage.CupSize.tall {
            cost += 0.10
        } else if  size == Beverage.CupSize.grande {
            cost += 0.15

        } else if  size == Beverage.CupSize.venti {
            cost += 0.20
        }
        
        return 0.15 + beverage.cost()
    }
    
    override func getDesc() -> String {
        return beverage.desc + "Soy"
    }
}
