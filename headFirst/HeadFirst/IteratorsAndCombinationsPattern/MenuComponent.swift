//
//  MenuComponent.swift
//  
//
//  Created by 疯狂的石头 on 2019/4/16.
//

import Foundation

struct MenuComponentTestDrive {
    
    static func test() {
        let pancakeMenu = PancakeHouseMenu()
        let dinerMenu = DinerMenu()
        let allMenus = Menu(with: "ALL MENUS", desc: "Desert of course!")
        allMenus.add(pancakeMenu)
        allMenus.add(dinerMenu)
    
        let newMenu = MenuItem(with: "Pasta", desc: "Spaghetti with Marinara Sauce, and a slice of sourdough bread", vegetarian: true, price: 3.89)
        
        // 此处有bug  如果A add B, B Add A 会导致两个forEach互相嵌套调用,会导致调用栈溢出
        dinerMenu.add(newMenu)
        dinerMenu.add(pancakeMenu)
        pancakeMenu.add(newMenu)
        let waitress = Waitress(with: allMenus)
        waitress.printMenu()
    }
    
    class MenuComponent {
        var name: String
        var desc: String
        var vegetarian: Bool
        var price: Double
        
        init() {
            self.name = ""
            self.desc = ""
            self.vegetarian = true
            self.price = 0
        }
        
        func add(_ menuComponent: MenuComponent) {
        }
        
        func remove(menuComponent: MenuComponent) {
        }
        
        func getChild(i: Int) -> MenuComponent? {
            return nil
        }
        
        func printf() throws {
            throw NSError(domain: "unsupported", code: 9999, userInfo: nil)
        }
    }
    
    class MenuItem: MenuComponent {
        
        init(with name: String, desc: String, vegetarian: Bool, price: Double) {
            super.init()
            self.name = name
            self.desc = desc
            self.vegetarian = vegetarian
            self.price = price
        }
        override func printf() throws {
            print("  \(name)")
            
            if vegetarian {
                print("v")
            }
            
            print(",  \(price)")
            print("     -- \(desc)")
        }
    }
    
    class Menu: MenuComponent {
        var menuComponents: [MenuComponent]
        
        convenience init(with name: String, desc: String) {
            self.init(with: [MenuComponent]())
            self.name = name
            self.desc = desc
        }
        
        init(with menuComponents: [MenuComponent]) {
            self.menuComponents = menuComponents
            super.init()
        }
        
        override func printf() throws {
            print("\(name)")
            print(",  \(desc)")
            print("-------------------")
            
            try menuComponents.forEach { (menuComponent) in
                try menuComponent.printf()
            }
        }
        
        override func add(_ menuComponent: MenuComponentTestDrive.MenuComponent) {
            menuComponents.append(menuComponent)
        }
        
        override func remove(menuComponent: MenuComponentTestDrive.MenuComponent) {
            (menuComponents as! NSMutableArray).remove(menuComponent)
        }
        
        override func getChild(i: Int) -> MenuComponentTestDrive.MenuComponent? {
            
            guard i < menuComponents.count else {
                return nil
            }
            return menuComponents[i]
        }
    }
    
    class DinerMenu: Menu {
        static var MAX_ITEMS: Int = 6
        var numberOfITems = 0

        init() {
            super.init(with: [MenuComponent]())
            addItem(with: "Vegetarian BLT", desc: "(FAkin') Bacon with lettuce & tomato on whole wheat)", vegetarian: true, price: 2.99)
            addItem(with: "BLT", desc: "Bacon with lettuce & tomato on whole wheat)", vegetarian: false, price: 2.99)
            addItem(with: "Soup of the day", desc: "Soup of the day, with a side of patato salad", vegetarian: false, price: 3.29)
            addItem(with: "Hotdog", desc: "a hot dog, with saurkraut, relish, onions, topped with cheese", vegetarian: false, price: 3.05)
        }
        
       private func addItem(with name: String, desc: String, vegetarian: Bool, price: Double) {
            let menuItem = MenuItem(with: name, desc: desc, vegetarian: vegetarian, price: price)
            if numberOfITems >= DinerMenu.MAX_ITEMS {
                print("Sorry, menu is full! Can not add item to menu")
            } else {
                menuComponents.append(menuItem)
                numberOfITems += 1
            }
        }
    }
    
    class PancakeHouseMenu: Menu {
        init() {
            super.init(with: [MenuComponent]())

            addItem(with: "K&B's pancake BreakFast", desc: "(Pancakes with scrambled eggs, and toast", vegetarian: true, price: 2.99)
            addItem(with: "Regular Pancake Breakfast", desc: "Pancakes with fried eggs, sausage", vegetarian: false, price: 2.99)
            addItem(with: "Blueberry Pancakes", desc: "Pancakes made with fresh blueberries", vegetarian: false, price: 3.49)
            addItem(with: "Waffles", desc: "Waffles, with your choice of blueberries or strawberries", vegetarian: false, price: 3.59)
        }
        
        private func addItem(with name: String, desc: String, vegetarian: Bool, price: Double) {
            let menuItem = MenuItem(with: name, desc: desc, vegetarian: vegetarian, price: price)
            menuComponents.append(menuItem)
        }
    }
    
    class Waitress {
        var allMenus: MenuComponent
        
        init(with allMenus: MenuComponent) {
            self.allMenus = allMenus
        }
        
        func printMenu() {
            try! allMenus.printf()
        }
    }
}
