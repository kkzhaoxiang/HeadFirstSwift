//
//  Pizza.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/2.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class Pizza {
    var name: String?
    var dough: String?
    var sauce: String?
    var toppings: [String]
    
    init() {
        toppings = [String]()
    }
}

extension Pizza {
    func prepare() {
        print("Prepare \(String(describing: name))")
        print("Tossing dough...")
        print("Add sauce...")
        print("Add toppings")
        
        toppings.forEach { (top) in
            print("    \(top)")
        }
    }
    
    func bake() {
        print("\(self) bake")
    }
    
    func cut() {
        print("\(self) cut")
    }
    
    func box() {
        print("\(self) box")
    }
}

class CheesePizza: Pizza {
    
}

class PepperoniPizza: Pizza {
    
}

class ClamPizza: Pizza {
    
}

class VeggiePizza: Pizza {
    
}
