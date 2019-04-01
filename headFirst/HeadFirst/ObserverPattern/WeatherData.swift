//
//  WeatherData.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/3/29.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class WeatherData: Subject {
    
    private var observers: NSMutableArray
    private var temperature: Float?
    private var humidity: Float?
    private var pressure: Float?

    init() {
        observers = NSMutableArray()
    }
    
    func registerObserver(o: Observer) {
        observers.add(o)
    }
    
    func removeObserver(o: Observer) {
        observers.remove(o)
    }
    
    func notifiyObserver() {
        for o in observers {
            (o as! Observer).update(temp: temperature, humidity: humidity, pressure: pressure)
        }
    }
    
    private func measurementsChanged() {
        notifiyObserver()
    }
    
    func setMeasurements(_ temperature: Float?, _ humidity: Float?,_ pressure: Float?) {
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
        measurementsChanged()
    }
}
