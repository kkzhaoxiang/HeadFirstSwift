//
//  DelegateTestDrive.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/19.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

//
//  GumballMachine.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/18.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation


struct DelegatePatternTestDrive {
    
    static func test() {
        let client = Client()
        client.say()

    }
    
    
}
protocol MyRemote {
    func sayHello()
}

class Client {
    func say() {
        let proxy = Proxy()
        proxy.sayHello()
    }
}

class RealSubject: MyRemote {
    func sayHello() {
        print("sayHello")
    }
}

class Proxy: MyRemote {
    
    private var delegate: RealSubject?
    
    init() {
        delegate = RealSubject()
    }
    
    func sayHello() {
        delegate?.sayHello()
    }
}

