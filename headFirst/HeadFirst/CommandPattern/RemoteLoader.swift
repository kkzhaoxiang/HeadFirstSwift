//
//  RemoteLoader.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/8.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class RemoteLoader {
    
    static func loadControl() {
        let remote = RemoteControl()
        let light = Light()
        let lightOn = LightOnCommand(with: light)
        let lightOff = LightOffCommand(with: light)
        
        let door = GarageDoor()
        let garageOn = GarageDoorOpenCommand(with: door)
        let garageOff = GarageDoorCloseCommand(with: door)
        
        let stereo = Stereo()
        let stereoOn = StereoOnWithCDCommand(with: stereo)
        let stereoOff = StereoOffWithCDCommand(with: stereo)
        
        remote.setCommand(slot: 0, onCommand: lightOn, offCommand: lightOff)
        remote.setCommand(slot: 1, onCommand: garageOn, offCommand: garageOff)
        remote.setCommand(slot: 2, onCommand: stereoOn, offCommand: stereoOff)
        
        remote.onButtonWasPushed(slot: 0)
        remote.offButtonWasPushed(slot: 0)
        remote.onButtonWasPushed(slot: 1)
        remote.offButtonWasPushed(slot: 1)
        remote.onButtonWasPushed(slot: 2)
        remote.offButtonWasPushed(slot: 2)
        
        let partyOn: [Command] = [lightOn, garageOn, stereoOn];
        let partyOff: [Command] = [lightOff, garageOff, stereoOff];
        
        let partyOnMacro = MacroCommand(with: partyOn)
        let partyOffMacro = MacroCommand(with: partyOff)
        
        remote.setCommand(slot: 4, onCommand: partyOnMacro, offCommand: partyOffMacro)
        remote.onButtonWasPushed(slot: 4)
        remote.offButtonWasPushed(slot: 4)
        
        
    }
}
