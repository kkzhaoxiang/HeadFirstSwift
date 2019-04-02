//
//  NYStylePizzaStore.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/2.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class NYStylePizzaStore: PizzaStore {
    func createPizza(type: String) -> Pizza? {
        var pizza: Pizza?
        
        switch type {
        case "cheese":
            pizza = NYStyleCheesePizza()
        case "pepperoni":
            pizza = NYStylePepperoniPizza()
        case "clam":
            pizza = NYStyleClamPizza()
        case "veggie":
            pizza = NYStyleVeggiePizza()
        default:
            pizza = nil
        }
        return pizza
    }
}
