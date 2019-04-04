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
    var dough: Dough?
    var sauce: Sauce?
    var veggies: [Veggies?]
    var chesse: Cheese?
    var pepperoni: Pepperoni?
    var clam: Clams?
    var toppings: [String]
    
    init() {
        toppings = [String]()
        veggies = [Veggies]()
    }
    
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

extension Pizza {
    
}

class CheesePizza: Pizza {
    var ingredientFactory: PizzaIngredientFactory
    
    init(with ingredientFacotry: PizzaIngredientFactory) {
        self.ingredientFactory = ingredientFacotry
    }
    
    override func prepare() {
        print("Preparing \(name ?? "")")
        dough = ingredientFactory.createDough()
        sauce = ingredientFactory.createSauce()
        chesse = ingredientFactory.createCheese()
    }
}

class PepperoniPizza: Pizza {
    
}

class ClamPizza: Pizza {
    var ingredientFactory: PizzaIngredientFactory
    init(with ingredientFactory: PizzaIngredientFactory) {
        self.ingredientFactory = ingredientFactory
    }
    
    override func prepare() {
        print("prepare \(name ?? "")")
        dough = ingredientFactory.createDough()
        sauce = ingredientFactory.createSauce()
        chesse = ingredientFactory.createCheese()
        clam = ingredientFactory.createClam()
    }
}

class VeggiePizza: Pizza {
    
}
