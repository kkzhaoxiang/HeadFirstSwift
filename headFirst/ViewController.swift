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
        
        let beverage: Beverage = Espresso()
        print(beverage.desc + " $" + "\(beverage.cost())")
        
        var beverage2: Beverage = DarkRoast()
        beverage2 = Mocha(with: beverage2)
        beverage2 = Mocha(with: beverage2)
        beverage2 = Whip(with: beverage2)

        print(beverage2.desc + " $" + "\(beverage2.cost())")

        var beverage3: Beverage = HouseBlend()
        beverage3 = Soy(with: beverage3)
        beverage3 = Mocha(with: beverage3)
        beverage3 = Whip(with: beverage3)
        
        print(beverage3.desc + " $" + "\(beverage3.cost())")

        

    }


}

