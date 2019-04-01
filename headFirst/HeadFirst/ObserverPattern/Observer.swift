//
//  Observerable.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/3/29.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

protocol Subject {
    func registerObserver(o: Observer)
    func removeObserver(o: Observer)
    func notifiyObserver()
}

protocol Observer {
    func update(temp: Float?, humidity: Float?, pressure: Float?)
}

protocol DisplayElement {
    func display()
}

