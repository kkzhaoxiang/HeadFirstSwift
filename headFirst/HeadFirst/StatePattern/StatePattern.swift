//
//  GumballMachine.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/18.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

protocol State {
    func insertQuater()
    func ejectQuater()
    func turnCrank()
    func dispense()
}

struct StatePatternTestDrive {
    
    enum NumberGumballs: Int {
        case sold_out = 0
        case no_quater = 1
        case has_quater = 2
        case sold = 3
    }
    
    class GumballMachine {
    
        var soldOutState: State?
        var noQuarterState: State?
        var hasQuarterState: State?
        var soldState: State?
        var state: State?
        var count: NumberGumballs?
        
        init() {
            
        }
        
        convenience init(with numberGumballs: NumberGumballs) {
            self.init()
            soldOutState = SoldOutState(withGumballMachine: self)
            noQuarterState = NoQuarterState(withGumballMachine: self)
            hasQuarterState = HasQueaterState(withGumballMachine: self)
            soldState = SoldState(withGumballMachine: self)
            state = soldState
            self.count = numberGumballs
            
            if numberGumballs.rawValue > 0 {
                state = noQuarterState
            }
        }
        
        func insertQuater() {
            state?.insertQuater()
        }
        
        func ejectQuater() {
            state?.ejectQuater()
        }
        
        func turnCrank() {
            state?.turnCrank()
            state?.dispense()
        }
        
        func releaseBall() {
            print("A gumball comes rolling out the slot")
            
            if count != .sold_out {
                count = NumberGumballs(rawValue: count?.rawValue ?? 0 - 1) ?? .sold_out
            }
        }
    }
    
    
    class SoldState: State {
        
        var gumballMachine: GumballMachine

        init(withGumballMachine gumballMachine: GumballMachine) {
            self.gumballMachine = gumballMachine
        }
        
        func insertQuater() {
            print("Please wait, we're already giving you a gumball")
        }
        
        func ejectQuater() {
            print("Sorry, you already turned the crank")
        }
        
        func turnCrank() {
            print("Turning twice doesn't get ou another gumball!")
        }
        
        func dispense() {
            gumballMachine.releaseBall()
            
            if gumballMachine.count != .sold_out {
                gumballMachine.state = gumballMachine.noQuarterState
            } else {
                print("Qops, out of gumballs!")
                gumballMachine.state = gumballMachine.soldOutState
            }
        }
    }
    
    class SoldOutState: State {
        var gumballMachine: GumballMachine

        init(withGumballMachine gumballMachine: GumballMachine) {
            self.gumballMachine = gumballMachine
        }
        func insertQuater() {
        }
        
        func ejectQuater() {
        }
        
        func turnCrank() {
        }
        
        func dispense() {
        }
        
    }
    
    class NoQuarterState: State {
        var gumballMachine: GumballMachine

        init(withGumballMachine gumballMachine: GumballMachine) {
            self.gumballMachine = gumballMachine
        }
        func insertQuater() {
            print("You inserted a quater")
            gumballMachine.state = gumballMachine.hasQuarterState
        }
        
        func ejectQuater() {
            print("You have not inserted a quater")
        }
        
        func turnCrank() {
            print("You turned, but there is no quater")
        }
        
        func dispense() {
            print("You need to pay first")
        }
    }
    
    class HasQueaterState: State {
        var gumballMachine: GumballMachine
        
        init(withGumballMachine gumballMachine: GumballMachine) {
            self.gumballMachine = gumballMachine
        }

        func insertQuater() {
            print("You can not inset another quarter")
        }
        
        func ejectQuater() {
            print("Quater returned")
            gumballMachine.state = gumballMachine.soldState
        }
        
        func turnCrank() {
            print("You haven't inserted a quater")
        }
        
        func dispense() {
            print("You need to pay first")
        }
        
    }
    
//    class WinnerState: State {
//        var gumballMachine: GumballMachine
//
//        init(withGumballMachine gumballMachine: GumballMachine) {
//            self.gumballMachine = gumballMachine
//        }
//
//
//    }
}
