//
//  Stereo.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/9.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

// MARK - Stereo

class Stereo: CommandProduct {
    func on() {
        print("\(self) is on")
    }
    
    func setCD() {
        print("\(self) set cd")
        
    }
    
    func setVolume(_ volume: Int) {
        print("\(self) set volme \(volume)")
    }
}

class StereoOnWithCDCommand: Command {
    
    var stereo: Stereo
    
    init(with stereo: Stereo) {
        self.stereo = stereo
    }
    
    func execute() {
        stereo.on()
        stereo.setCD()
        stereo.setVolume(11)
    }
    
    func undo() {
        stereo.off()
        stereo.setCD()
        stereo.setVolume(0)
    }
}

class StereoOffWithCDCommand: Command {
    
    var stereo: Stereo
    
    init(with stereo: Stereo) {
        self.stereo = stereo
    }
    
    func execute() {
        stereo.off()
        stereo.setCD()
        stereo.setVolume(0)
    }
    
    func undo() {
        stereo.on()
        stereo.setCD()
        stereo.setVolume(11)
    }
}
