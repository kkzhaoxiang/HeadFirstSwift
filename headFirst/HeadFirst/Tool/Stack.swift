//
//  Stack.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/18.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class Stack<E>  {
    var stack: [E]
    
    init() {
        stack = [E]()
    }
    
    func push(x: E) {
        stack.append(x)
    }
    
    func pop() -> E? {
        return stack.count > 0 ? stack.removeLast() : nil
    }
    
    func top() -> E? {
        return stack.last
    }
    
    func empty() -> Bool {
        return stack.count <= 0
    }
}
