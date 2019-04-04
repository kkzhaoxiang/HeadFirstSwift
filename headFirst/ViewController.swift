//
//  ViewController.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/3/28.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let remote = SimpleRemoteControl()
        let light = Light()
        let lightOn = LightOnCommand(with: light)
        let door = GarageDoor()
        let garageOn = GarageDoorOpenCommand(with: door)
        remote.setCommand(command: lightOn)
        remote.buttonWasPressed()
        remote.setCommand(command: garageOn)
        remote.buttonWasPressed()
    }


}

