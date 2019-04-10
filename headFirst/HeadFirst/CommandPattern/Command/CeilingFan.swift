//
//  CellFan.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/9.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

enum CeilingFanSpeed: Int {
    case high = 3
    case medium = 2
    case low = 1
    case off = 0
}

class CeilingFan {
    
    var location: String
    var speed: CeilingFanSpeed
    
    init(with location: String) {
        self.location = location
        speed = .off
    }
    
    func high() {
        speed = .high
    }
    
    func medium() {
        speed = .medium
    }
    
    func low() {
        speed = .low
    }
    
    func off() {
        speed = .off
    }
}

class CeilingFanHighCommand: Command {
    
    var ceilingFan: CeilingFan
    var prevSpeed: CeilingFanSpeed
    
    init(with ceilingFan: CeilingFan) {
        self.ceilingFan = ceilingFan
        prevSpeed = .off
    }
    
    func execute() {
        prevSpeed = ceilingFan.speed
        ceilingFan.high()
    }
    
    func undo() {
        switch prevSpeed {
        case .high:
            ceilingFan.high()
        case .medium:
            ceilingFan.medium()
        case .low:
            ceilingFan.low()
        case .off:
            ceilingFan.off()
        }
    }
}

class CeilingFanMediumCommand: Command {
    
    var ceilingFan: CeilingFan
    var prevSpeed: CeilingFanSpeed
    
    init(with ceilingFan: CeilingFan) {
        self.ceilingFan = ceilingFan
        prevSpeed = .off
    }
    
    func execute() {
        prevSpeed = ceilingFan.speed
        ceilingFan.medium()
    }
    
    func undo() {
        switch prevSpeed {
        case .high:
            ceilingFan.high()
        case .medium:
            ceilingFan.medium()
        case .low:
            ceilingFan.low()
        case .off:
            ceilingFan.off()
        }
    }
}

class CeilingFanLowCommand: Command {
    
    var ceilingFan: CeilingFan
    var prevSpeed: CeilingFanSpeed
    
    init(with ceilingFan: CeilingFan) {
        self.ceilingFan = ceilingFan
        prevSpeed = .off
    }
    
    func execute() {
        prevSpeed = ceilingFan.speed
        ceilingFan.low()
    }
    
    func undo() {
        switch prevSpeed {
        case .high:
            ceilingFan.high()
        case .medium:
            ceilingFan.medium()
        case .low:
            ceilingFan.low()
        case .off:
            ceilingFan.off()
        }
    }
}

class CeilingFanOffCommand: Command {
    
    var ceilingFan: CeilingFan
    var prevSpeed: CeilingFanSpeed
    
    init(with ceilingFan: CeilingFan) {
        self.ceilingFan = ceilingFan
        prevSpeed = .off
    }
    
    func execute() {
        prevSpeed = ceilingFan.speed
        ceilingFan.off()
    }
    
    func undo() {
        switch prevSpeed {
        case .high:
            ceilingFan.high()
        case .medium:
            ceilingFan.medium()
        case .low:
            ceilingFan.low()
        case .off:
            ceilingFan.off()
        }
    }
}
