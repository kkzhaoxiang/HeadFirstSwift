//
//  SimplePizzaFactory.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/2.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation


class SimplePizzaFactory: Factory {
    
    func createPizza(type: String) -> Pizza? {
        var pizza: Pizza?
        let factory = NYPizzaIngredientFactory()
        switch type {
        case "cheese":
            pizza = CheesePizza(with: factory)
        case "pepperoni":
            pizza = PepperoniPizza()
        case "clam":
            pizza = ClamPizza(with: factory)
        case "veggie":
            pizza = VeggiePizza()
        default:
            pizza = nil
        }
        return pizza
    }
}
