//
//  CurrentConditionsDisplay.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/3/29.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation


class CurrentConditionsDisplay: Observer, DisplayElement {
    
    func update() {
        
    }
    private var temperature: Float?
    private var humidity: Float?
    private var weatherData: Subject
    
    init(with subject: Subject) {
        weatherData = subject
        weatherData.registerObserver(o: self)
    }
    
    func update(temp: Float?, humidity: Float?, pressure: Float?) {
        self.temperature = temp
        self.humidity = humidity
        display()
    }
    
    func display() {
        print("Current conditions: \(String(describing: temperature)) F degress and humidity \(String(describing: humidity))")
    }
    
}
