//
//  Coffee.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/12.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

protocol CaffeIneBevarage {
    func brew()
    func addCondiments()
}

extension CaffeIneBevarage {
    func prepareRecipe() {
        boilWater()
        brew()
        pourInCup()
        addCondiments()
    }
    
    func boilWater() {
        print("Boiling water")
    }
    
    func pourInCup() {
        print("Pouring into cup")
    }
}

class Coffee: CaffeIneBevarage {
    func brew() {
        print("Dripping Coffee through filter")
    }
    
    func addCondiments() {
        print("Adding Sugar and milk")
    }
}

class Tea: CaffeIneBevarage {
    func brew() {
        print("Steeping the tea")
    }
    
    func addCondiments() {
        print("Adding Lemon")
    }
}

