//
//  AdapterDrive.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/9.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class DuckTestDrive {
    
    static func test() {
        let turkey = WildTurkey()
        
        turkey.gobble()
        turkey.fly()
        
        let tuyKeyAdapter = TurkeyAdapter(with: turkey)
        testDuck(duck: tuyKeyAdapter)
    }
    
    static func testDuck(duck: TurkeyDuck) {
        duck.quack()
        duck.fly()
    }
}


