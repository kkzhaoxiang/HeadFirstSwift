//
//  BeatController.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/24.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

protocol ControllerInterface {
    func start()
    func stop()
    func increaseBPM()
    func decreaseBPM()
    func setBPM(bpm: Int)
}

class BeatController: ControllerInterface {
    
    var model: BeatModelInterface

    init(withModel model: BeatModelInterface) {
        self.model = model
    }
    
    func start() {
        
    }
    
    func stop() {
        
    }
    
    func increaseBPM() {
        
    }
    
    func decreaseBPM() {
        
    }
    
    func setBPM(bpm: Int) {
        
    }
    
    
}
