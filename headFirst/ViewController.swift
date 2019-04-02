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
        
        let nyStore = NYStylePizzaStore()
        let nyPizza = nyStore.orderPizza(type: "cheese")
        
        print("Ethan oridered a \(nyPizza?.name ?? "")")

    }


}

