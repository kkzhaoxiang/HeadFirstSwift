//
//  BeatView.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/24.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation


class DJView: BeatObserver, BPMObserver {
    
    var model: BeatModelInterface?
    var controller: ControllerInterface?
    
    init() {
        
    }
    
    convenience init(withController controller: ControllerInterface, model: BeatModelInterface) {
        self.init()
        self.controller = controller
        self.model = model
    }
    
    func updateBeat() {
        
    }
    
    func updateBPM() {
        
    }
    
    
    
    
}
