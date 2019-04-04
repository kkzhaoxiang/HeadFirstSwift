//
//  Command.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/4.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

protocol Command {
    func execute()
}

protocol CommandProduct {
}

extension CommandProduct {
    func on() {
        print("\(self) is on")
    }
    
    func off() {
        print("\(self) is off")
    }
}

class SimpleRemoteControl {
    var slot: Command?
    
    func setCommand(command: Command) {
        slot = command
    }
    
    func buttonWasPressed() {
        slot?.execute()
    }
}


class Light {
    func on() {
        print("Light is on")
    }
    
    func off() {
        print("Light is off")
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
}

class GarageDoor: CommandProduct {
    
}

class GarageDoorOpenCommand: Command {
    
    var door: GarageDoor
    
    init(with door: GarageDoor) {
        self.door = door
    }
    
    func execute() {
        door.on()
    }

}



