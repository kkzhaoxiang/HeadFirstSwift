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
    
    static func test() {
        let gumballsMachine = GumballMachine(with: 5)
        print(gumballsMachine)
        
        gumballsMachine.insertQuater()
        gumballsMachine.turnCrank()
        
        print(gumballsMachine)

        gumballsMachine.turnCrank()
        gumballsMachine.insertQuater()
        gumballsMachine.turnCrank()
        
        print(gumballsMachine)

    }
    
    class GumballMachine {
    
        var soldOutState: State?
        var noQuarterState: State?
        var hasQuarterState: State?
        var soldState: State?
        var winnerState: State?
        var state: State?
        var count = 0
        
        private init() { }
        
        convenience init(with numberGumballs: Int) {
            self.init()
            soldOutState = SoldOutState(withGumballMachine: self)
            noQuarterState = NoQuarterState(withGumballMachine: self)
            hasQuarterState = HasQueaterState(withGumballMachine: self)
            soldState = SoldState(withGumballMachine: self)
            winnerState = WinnerState(withGumballMachine: self)
            state = soldState
            self.count = numberGumballs
            
            if numberGumballs > 0 {
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
            
            if count != 0 {
                count -= 1
            }
        }
        
        func refill(numgallballs: Int) {
            count = numgallballs
            state = noQuarterState
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
            
            if gumballMachine.count != 0 {
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
            print("You can't insert a quater, the machine is sold out")
        }
        
        func ejectQuater() {
            print("You can't eject, you haven't insert a quater yet")
        }
        
        func turnCrank() {
            print("You turned, but there no qumballs")
        }
        
        func dispense() {
            print("No gumball dispensed")
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
            let winner = Int.random(in: 0..<10)
            if winner == 0 && gumballMachine.count > 0{
                gumballMachine.state = gumballMachine.winnerState
            } else {
                gumballMachine.state = gumballMachine.soldState
            }
        }
        
        func dispense() {
            print("No gumball dispensed")
        }
        
    }
    
    class WinnerState: State {
        
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
            print("YOU'RE A WINNER! You get two gumballs for your quarter")
            gumballMachine.releaseBall()
            
            if gumballMachine.count != 0 {
                gumballMachine.state = gumballMachine.noQuarterState
            } else {
                print("Qops, out of gumballs")
                gumballMachine.state = gumballMachine.soldOutState
            }
        }

    }
}
