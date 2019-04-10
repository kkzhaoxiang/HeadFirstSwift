//
//  Light.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/9.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

// MARK: - Light

class Light {
    func on() {
        print("\(self) is on")
    }
    
    func off() {
        print("\(self) is off")
    }
}

class LightOnCommand: Command {
    
    var light: Light
    
    init(with light: Light) {
        self.light = light
    }
    
    func execute() {
        light.on()
    }
    
    func undo() {
        
    }
}

class LightOffCommand: Command {
    
    var light: Light
    
    init(with light: Light) {
        self.light = light
    }
    
    func execute() {
        light.off()
    }
    
    func undo() {
        light.on()
    }
}
