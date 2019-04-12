//
//  TemplateMethodBeverageTestDrive.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/12.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class TemplateMethodBeverageTestDrive {
    static func test() {
        print("tea.....hook")
        let tea = TeaWithHook()
        tea.prepareRecipe()
        print("coffee......hook")
        let coffee = CoffeeWithHook()
        coffee.prepareRecipe()
    }
}
