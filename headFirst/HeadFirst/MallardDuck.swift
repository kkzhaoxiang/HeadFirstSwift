//
//  MallardDuck.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/3/28.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class MallardDuck: Duck {
    
    override init() {
        super.init()
        quackBehavior = Quack()
        flyBehavior = FlyWithWings()
    }
    
    override func display() {
        print("I'm a real Mallard duck")
    }
    
    

}
