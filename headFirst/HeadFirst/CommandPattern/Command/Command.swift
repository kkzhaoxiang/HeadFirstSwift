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
    func undo()
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

class NoCommand: Command {
    func undo() {
        
    }
    
    func execute() {
        print("NoCommand")
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

class MacroCommand: Command {
    
    var commands: [Command]?
    
    init(with commands: [Command]?) {
        self.commands = commands
    }
    
    func execute() {
        commands?.forEach({ (command) in
            command.execute()
        })
    }
    
    func undo() {
        commands?.forEach({ (command) in
            command.undo()
        })
    }
    
    
}







