//
//  CaffeIneBevarageHook.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/12.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

protocol CaffeIneBevarageHook {
    func brew()
    func addCondiments()
    func customerWantsCondiments() -> Bool
}

extension CaffeIneBevarageHook {
    func prepareRecipe() {
        boilWater()
        brew()
        pourInCup()
        
        if customerWantsCondiments() {
            addCondiments()
        }
    }
    
    func boilWater() {
        print("Boiling water")
    }
    
    func pourInCup() {
        print("Pouring into cup")
    }
    
    // hook
    func customerWantsCondiments() -> Bool {
        return true
    }
}

class CoffeeWithHook: CaffeIneBevarageHook {
    

    func brew() {
        print("Dripping Coffee through filter")
    }
    
    func addCondiments() {
        print("Adding Sugar and milk")
    }
    
    func customerWantsCondiments() -> Bool {
        return false;
    }
}

class TeaWithHook: CaffeIneBevarageHook {
    func brew() {
        print("Steeping the tea")
    }
    
    func addCondiments() {
        print("Adding Lemon")
    }
}
