//
//  BeatModel.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/24.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation


protocol BeatModelInterface {
    func initialize()
    func on()
    func off()
    func setBPM(bpm: Int)
    func getBPM() -> Int
    func registerObserver(observer: BeatObserver)
    func removeObserver(observer: BeatObserver)
    func registerObserver(observer: BPMObserver)
    func removeObserver(observer: BPMObserver)
}

protocol BeatObserver {
    func updateBeat()
}

protocol BPMObserver {
    func updateBPM()
}

class BeatModel: BeatModelInterface {
    var beatObservers: [BeatObserver]
    var bpmObservers: [BPMObserver]
    var bpm: Int = 90
    
    init() {
        beatObservers = [BeatObserver]()
        bpmObservers = [BPMObserver]()
    }
    
    func setupMidi() {
        
    }
    
    func initialize() {
        
    }
    
    func on() {
        setBPM(bpm: 90)
    }
    
    func off() {
        setBPM(bpm: 0)
    }
    
    func setBPM(bpm: Int) {
        self.bpm = bpm
        
    }
    
    func beatEvent() {
        notifyBeatObservers()
    }
    
    func getBPM() -> Int {
        return bpm
    }
    
    func registerObserver(observer: BeatObserver) {
        beatObservers.append(observer)
    }
    
    func removeObserver(observer: BeatObserver) {
        (beatObservers as! NSMutableArray).remove(observer)
    }
    
    func registerObserver(observer: BPMObserver) {
        bpmObservers.append(observer)
    }
    
    func removeObserver(observer: BPMObserver) {
        (bpmObservers as! NSMutableArray).remove(observer)
    }
    
    func notifyBeatObservers() {
        beatObservers.forEach { (o) in
            o.updateBeat()
        }
    }
    
    func notifyBPMObservers() {
        bpmObservers.forEach { (o) in
            o.updateBPM()
        }
    }
    
}

protocol HeartAdapterInterface {
    
    func getHeartRate() -> Int
}

class HeartAdapter: BeatModelInterface {
    
    var heart: HeartAdapterInterface
    
    init(withHeart heart: HeartAdapterInterface) {
        self.heart = heart
    }
    
    func initialize() {
        
    }
    
    func on() {
        
    }
    
    func off() {
        
    }
    
    func setBPM(bpm: Int) {
        
    }
    
    func getBPM() -> Int {
        return heart.getHeartRate()
    }
    
    func registerObserver(observer: BeatObserver) {
        
    }
    
    func removeObserver(observer: BeatObserver) {
        
    }
    
    func registerObserver(observer: BPMObserver) {
        
    }
    
    func removeObserver(observer: BPMObserver) {
        
    }
    

}
