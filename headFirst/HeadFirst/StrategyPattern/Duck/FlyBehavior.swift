//
//  FlyBehavior.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/3/28.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

protocol FlyBehavior {
    func fly()
}

extension FlyBehavior {
    func fly() {
        
    }
}

class FlyWithWings: FlyBehavior {
    func fly() {
        print("鸭子飞行")
    }
}

class FlyNoWay: FlyBehavior {
    func fly() {
        print("什么都不做")
    }
}

class FlyRocketPowered: FlyBehavior {
    func fly() {
        print("I'm a flying with a rocket!")
    }
}


