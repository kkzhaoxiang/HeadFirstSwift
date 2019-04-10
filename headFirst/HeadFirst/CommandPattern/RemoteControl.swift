//
//  RemoteControl.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/8.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class RemoteControl {
    
    var onCommands: [Command?]
    var offCommands: [Command?]
    var undoCommand: Command
    
    init() {
        
        onCommands = [Command?]()
        offCommands = [Command?]()
        
        let noCommand = NoCommand()
        
        for _ in 0..<7 {
            onCommands.append(noCommand)
            offCommands.append(noCommand)
        }
        
        undoCommand = noCommand
    }
    
    func setCommand(slot: Int, onCommand: Command, offCommand: Command) {
        onCommands[slot] = onCommand
        offCommands[slot] = offCommand
    }
    
    func onButtonWasPushed(slot: Int) {
        onCommands[slot]?.execute()
    }
    
    func offButtonWasPushed(slot: Int) {
        offCommands[slot]?.execute()
    }
    
    func undoButtonWasPushed() {
        undoCommand.undo()
    }
}
