//
//  WeaponBehavior.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/3/29.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

protocol WeapodBehavior {
    func useWeapod()
}

extension WeapodBehavior {
    func useWeapod() {
        
    }
}

class KnifeBehavior: WeapodBehavior {
    func useWeapod() {
        print("Knife")
    }
}

class AxeBehavior: WeapodBehavior {
    func useWeapod() {
        print("Axe")
    }
}

class BowAndArrowBehavior: WeapodBehavior {
    func useWeapod() {
        print("BowAndArrow")
    }
}

class SwordBehavior: WeapodBehavior {
    func useWeapod() {
        print(" Sword")
    }
}



