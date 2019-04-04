//
//  PizzaIngredientFactory.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/3.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

protocol PizzaIngredientFactory {
    func createDough() -> Dough?
    func createSauce() -> Sauce?
    func createCheese() -> Cheese?
    func createVeggies() -> [Veggies?]
    func createPepperoni() -> Pepperoni?
    func createClam() -> Clams?
}

class NYPizzaIngredientFactory: PizzaIngredientFactory {
    
    required init() {
        
    }
    
    func createDough() -> Dough? {
        return ThineCrestDough()
    }
    
    func createSauce() -> Sauce? {
        return MarinaraSauce()
    }
    
    func createCheese() -> Cheese? {
        return ReggianoCheese()
    }
    
    func createVeggies() -> [Veggies?] {
        return [Garlic(), Onion(), MushRoom(), RedPerpper()]
    }
    
    func createPepperoni() -> Pepperoni? {
        return SlicedPepperoni()
    }
    
    func createClam() -> Clams? {
        return FreshClams()
    }
    
    
}
