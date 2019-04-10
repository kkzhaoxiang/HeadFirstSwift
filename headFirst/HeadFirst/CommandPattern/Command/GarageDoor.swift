//
//  GarageDoor.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/9.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

// MARK: - GarageDoor

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
    
    func undo() {
        door.off()
    }
}

class GarageDoorCloseCommand: Command {
    
    var door: GarageDoor
    
    init(with door: GarageDoor) {
        self.door = door
    }
    
    func execute() {
        door.off()
    }
    
    func undo() {
        door.on()
    }
}
