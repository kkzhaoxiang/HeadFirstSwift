//
//  Beverage.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/1.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class Beverage {
    
    enum CupSize {
        case none
        case tall
        case grande
        case venti
    }
    
    var desc: String
    var size: CupSize
    
    init() {
        desc = ""
        size = CupSize.none
    }
    
    func cost() -> Float {
        return 0.00
    }
    
    func getDesc() -> String {
        return ""
    }
    
    
}
