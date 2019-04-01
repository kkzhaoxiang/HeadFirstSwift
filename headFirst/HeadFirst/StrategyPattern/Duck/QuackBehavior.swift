//
//  QuackBehavior.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/3/28.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation


protocol QuackBehavior {
    
    func quack()
}

extension QuackBehavior {
    func quack() {}
}

class Quack: QuackBehavior {
    func quack() {
        print("实现鸭子呱呱叫")
    }
}

class Squack: QuackBehavior {
    func quack() {
        print("橡皮鸭子吱吱叫")
    }
}

class MuteQuack: QuackBehavior {
    func quack() {
        print("什么都不做")
    }
}


