//
//  PizzaStore.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/2.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation


protocol PizzaStore {
    func createPizza(type: String) -> Pizza?
}

extension PizzaStore {
    @discardableResult
    func orderPizza(type: String) -> Pizza? {
        let pizza = self.createPizza(type: type)
        pizza?.prepare()
        pizza?.bake()
        pizza?.cut()
        pizza?.box()
        return pizza
    }
}
