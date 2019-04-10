//
//  Turkey.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/9.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

protocol Turkey {
    func gobble()
    func fly()
}

protocol TurkeyDuck {
    func fly()
    func quack()
}

class WildTurkey: Turkey {
    func gobble() {
        print("Gobble gobble")
    }
    
    func fly() {
        print("I'm flying a short distance")
    }
}

class TurkeyAdapter: TurkeyDuck {
    var turkey: Turkey
    
    init(with turkey: Turkey) {
        self.turkey = turkey
    }
    
    func quack() {
        turkey.gobble()
    }
    
    func fly() {
        for _ in 0..<5 {
            turkey.fly()
        }
    }
}
