//
//  ModelDuck.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/3/28.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class ModelDuck: Duck {
    override init() {
        super.init()
        
        flyBehavior = FlyNoWay()
        quackBehavior = Quack()
    }
    
    override func display() {
        print("I'm a model duck")
    }
}
