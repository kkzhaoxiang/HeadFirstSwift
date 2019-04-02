//
//  NYPizza.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/2.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation


class NYStyleCheesePizza: Pizza {
    override init() {
        super.init()
        name = "NY Style Sauce and Cheese Pizza"
        dough = "Thin Crust Dough"
        sauce = "Marinara Sauce"
        
        toppings.append("Grated Reggiano Cheese")
    }
}

class NYStyleVeggiePizza: Pizza {
    
}

class NYStyleClamPizza: Pizza {
    
}

class NYStylePepperoniPizza: Pizza {
    
}
