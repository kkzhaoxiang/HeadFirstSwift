//
//  Duck.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/3/28.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class Duck {
    
    var flyBehavior: FlyBehavior?
    var quackBehavior: QuackBehavior?
    
    
    func swim() {
        print("swim")
    }
    
    func display() {
        print("display")
    }
    
    func performQuack() {
        quackBehavior?.quack()
    }
    
    func performFly() {
        flyBehavior?.fly()
    }
}
