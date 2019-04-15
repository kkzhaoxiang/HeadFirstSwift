//
//  MenuDrice.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/15.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class MenuTestDrive {
    static func test() {
        let pancakeHouseMenu = PancakeHouseMenu()
        let dinerMenu = DinerMenu()
        let cafeMenu = CafeMeun()
        let waitress = Waitress(with: pancakeHouseMenu, dinerMenu: dinerMenu, cafeMenu: cafeMenu)
        waitress.printMenu()
    }
}
