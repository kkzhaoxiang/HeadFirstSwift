//
//  Menu.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/15.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

fileprivate protocol Menu {
    associatedtype Element: Iterator
    mutating func createIterator() -> Element
}

struct MenuTestDrice {
    
    static func test() {
        let pancakeHouseMenu = PancakeHouseMenu()
        let dinerMenu = DinerMenu()
        let cafeMenu = CafeMeun()
        let waitress = Waitress(with: pancakeHouseMenu, dinerMenu: dinerMenu, cafeMenu: cafeMenu)
        waitress.printMenu()
    } 
    
    class MenuItem {
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
        
        init(with name: String, desc: String, vegetarian: Bool, price: Double) {
            self.name = name
            self.desc = desc
            self.vegetarian = vegetarian
            self.price = price
        }
    }
    
    class DinerMenuIterator<E>: Iterator {
        typealias Element = E?
        var items: [E?]
        var position: Int = 0
        
        init(with items: [E?]) {
            self.items = items
        }
        
        func next() -> DinerMenuIterator.Element? {
            let menuItem = items[position]
            position += 1
            return menuItem
        }
        
        func hasNext() -> Bool {
            guard position >= items.count || items[position] == nil else {
                return true
            }
            return false
        }
    }
    
    class PancakeHouseMenuIterator<E>: Iterator {
        typealias Element = E?
        var items: [E?]
        var position: Int = 0
        
        init(with items: [E?]) {
            self.items = items
        }
        
        func next() -> PancakeHouseMenuIterator.Element? {
            let menuItem = items[position]
            position += 1
            return menuItem
        }
        
        func hasNext() -> Bool {
            guard position >= items.count || items[position] == nil else {
                return true
            }
            return false
        }
    }
    
    class CafeMenuIterator<E>: Iterator {
        typealias Element = E
        var items: [String: Element]
        var item: Element?
        var position: Int = 0
        init(with items: [String: Element]) {
            self.items = items
            self.position = 0
            self.item = (items as NSDictionary).allValues[self.position] as? E
        }
        
        func next() -> CafeMenuIterator.Element? {
            let menuItem = (items as NSDictionary).allValues[self.position] as? E
            item = menuItem
            position += 1
            return item ?? nil
        }
        
        func hasNext() -> Bool {
            if item != nil {
                return true
            }
            return false
        }
    }
    
    class DinerMenu: Menu {
        static var MAX_ITEMS: Int = 6
        var numberOfITems = 0
        var menuItems: [MenuItem?]
        
        init() {
            menuItems = [MenuItem?]()
            addItem(with: "Vegetarian BLT", desc: "(FAkin') Bacon with lettuce & tomato on whole wheat)", vegetarian: true, price: 2.99)
            addItem(with: "BLT", desc: "Bacon with lettuce & tomato on whole wheat)", vegetarian: false, price: 2.99)
            addItem(with: "Soup of the day", desc: "Soup of the day, with a side of patato salad", vegetarian: false, price: 3.29)
            addItem(with: "Hotdog", desc: "a hot dog, with saurkraut, relish, onions, topped with cheese", vegetarian: false, price: 3.05)
        }
        
        func addItem(with name: String, desc: String, vegetarian: Bool, price: Double) {
            let menuItem = MenuItem(with: name, desc: desc, vegetarian: vegetarian, price: price)
            if numberOfITems >= DinerMenu.MAX_ITEMS {
                print("Sorry, menu is full! Can not add item to menu")
            } else {
                menuItems.append(menuItem)
                numberOfITems += 1
            }
        }
        
        func createIterator() -> DinerMenuIterator<MenuItem> {
            return DinerMenuIterator<MenuItem>(with: self.menuItems)
        }
    }
    
    class PancakeHouseMenu: Menu {
        var menuItems: [MenuItem?]
        
        init() {
            menuItems = [MenuItem?]()
            addItem(with: "K&B's pancake BreakFast", desc: "(Pancakes with scrambled eggs, and toast", vegetarian: true, price: 2.99)
            addItem(with: "Regular Pancake Breakfast", desc: "Pancakes with fried eggs, sausage", vegetarian: false, price: 2.99)
            addItem(with: "Blueberry Pancakes", desc: "Pancakes made with fresh blueberries", vegetarian: false, price: 3.49)
            addItem(with: "Waffles", desc: "Waffles, with your choice of blueberries or strawberries", vegetarian: false, price: 3.59)
        }
        
        func addItem(with name: String, desc: String, vegetarian: Bool, price: Double) {
            let menuItem = MenuItem(with: name, desc: desc, vegetarian: vegetarian, price: price)
            menuItems.append(menuItem)
        }
        
        func createIterator() -> PancakeHouseMenuIterator<MenuItem> {
            return PancakeHouseMenuIterator<MenuItem>(with: self.menuItems)
        }
    }
    
    class CafeMeun: Menu {
        var menuItems: [String: MenuItem]
        
        init() {
            menuItems = [String: MenuItem]()
            addItem(with: "CafeMeun K&B's pancake BreakFast", desc: "(Pancakes with scrambled eggs, and toast", vegetarian: true, price: 2.99)
            addItem(with: "CafeMeun Regular Pancake Breakfast", desc: "Pancakes with fried eggs, sausage", vegetarian: false, price: 2.99)
            addItem(with: "CafeMeun Blueberry Pancakes", desc: "Pancakes made with fresh blueberries", vegetarian: false, price: 3.49)
            addItem(with: "CafeMeun Waffles", desc: "Waffles, with your choice of blueberries or strawberries", vegetarian: false, price: 3.59)
        }
        
        func addItem(with name: String, desc: String, vegetarian: Bool, price: Double) {
            let menuItem = MenuItem(with: name, desc: desc, vegetarian: vegetarian, price: price)
            menuItems[name] = menuItem
        }
        func createIterator() -> CafeMenuIterator<MenuItem> {
            return CafeMenuIterator<MenuItem>(with: self.menuItems)
        }
    }
    
    class Waitress {
        var pancakeHouseMenu: PancakeHouseMenu
        var dinerMenu: DinerMenu
        var cafeMenu: CafeMeun
        
        init(with pancakeHouseMenu: PancakeHouseMenu, dinerMenu: DinerMenu, cafeMenu: CafeMeun) {
            self.pancakeHouseMenu = pancakeHouseMenu
            self.dinerMenu = dinerMenu
            self.cafeMenu = cafeMenu
        }
        
        func printMenu() {
            let pancakeIterator = pancakeHouseMenu.createIterator()
            let dinerIterator = dinerMenu.createIterator()
            let cafeIterator = cafeMenu.createIterator()
            print("MENU\n----\nBREAKFAST")
            printMenu(iterator: pancakeIterator)
            print("LAUNCH")
            printMenu(iterator: dinerIterator)
            print("Cafe ----------")
            printMenu(iterator: cafeIterator)
        }
        
        private func printMenu<T: Iterator>(iterator: T) {
            while iterator.hasNext() {
                let menuItem = iterator.next() as! MenuItem
                print("\(menuItem.name), ")
                print("\(menuItem.price) --")
                print("\(menuItem.desc)")
            }
        }
        
    }
}


