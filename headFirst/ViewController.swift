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

        MenuTestDrive.test()

    }
    
    func createButton() {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func clicked() {
        print("clicked 4")
    }


}

