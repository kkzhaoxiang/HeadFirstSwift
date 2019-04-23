//
//  CompoundPattern.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/23.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

protocol Quackable: QuackObservable {
    var observable: DuckObservable? { set get }
    func quack()
}

extension Quackable {
    func quack() {
        print("Quack")
    }
    
    func registerObserver(observer: DuckObserver) {
        observable?.registerObserver(observer: observer)
    }
    
    func notifyObservers() {
        observable?.notifyObservers()
    }
}

protocol QuackObservable {
    func registerObserver(observer: DuckObserver)
    func notifyObservers()
}

class DuckObservable: QuackObservable {
    var observers = [DuckObserver]()
    var duck: QuackObservable
    
    init(withDuck duck: QuackObservable) {
        self.duck = duck
    }
    
    func registerObserver(observer: DuckObserver) {
        observers.append(observer)
    }
    
    func notifyObservers() {
        observers.forEach { (observer) in
            observer.update(duck: self.duck)
        }
    }
}

protocol DuckObserver {
    func update(duck: QuackObservable)
}

class Quckologist: DuckObserver {
    func update(duck: QuackObservable) {
        print("Quckologist \(duck) just quacked")
    }
}

struct CompoundPatternTestDrive {
    
    static func test() {
        DuckSimulator.simulate()
    }
    
    // MARK: - 模拟器
    class DuckSimulator {
        static func simulate() {
            // 装饰模式创建鸭子
//            let mallardDuck = QuackCounter(withDuck: MallardDuck())
//            let redheadDuck = QuackCounter(withDuck: RedheadDuck())
//            let duckCall = QuackCounter(withDuck: DuckCall())
//            let rubberDuck = QuackCounter(withDuck: DuckCall())
//            let gooseDuck = QuackCounter(withDuck: GooseAdapter(withGoose: Goose()))
//
//            simulate(duck: mallardDuck)
//            simulate(duck: redheadDuck)
//            simulate(duck: duckCall)
//            simulate(duck: rubberDuck)
//            simulate(duck: gooseDuck)
//
//            print(QuackCounter.quacks())
//
            print("Factory-----")
            
            // 工厂模式创建鸭子
            let counterFactory = CountingDuckFactory()
            simulate(duckFactory: counterFactory)
            // 迭代控制所有鸭子行为
//            simulateFlock(duckFactory: counterFactory)
            
            
        }
        
        static func simulate(duckFactory: AbstractDuckFactory) {
            let mallardDuck = duckFactory.createMallardDuck()
            let redheadDuck = duckFactory.createRedheadDuck()
            let duckCall = duckFactory.createDuckCall()
            let rubberDuck = duckFactory.createRubberDuck()
            let gooseDuck = duckFactory.createGoose()

//            simulate(duck: mallardDuck)
//            simulate(duck: redheadDuck)
//            simulate(duck: duckCall)
//            simulate(duck: rubberDuck)
//            simulate(duck: gooseDuck)

            print(QuackCounter.quacks())
            
            let flock = Flock()
            flock.add(qucker: mallardDuck)
            flock.add(qucker: redheadDuck)
            flock.add(qucker: duckCall)
            flock.add(qucker: rubberDuck)
            flock.add(qucker: gooseDuck)
            flock.quack()
            
            // 添加一个观察者
            let quckologist = Quckologist()
            flock.registerObserver(observer: quckologist)
            mallardDuck.notifyObservers()
            redheadDuck.notifyObservers()
        }
        
        static func simulateFlock(duckFactory: AbstractDuckFactory) {
            let mallardDuck = duckFactory.createMallardDuck()
            let redheadDuck = duckFactory.createRedheadDuck()
            let duckCall = duckFactory.createDuckCall()
            let rubberDuck = duckFactory.createRubberDuck()
            let gooseDuck = duckFactory.createGoose()
            
            let flock = Flock()
            flock.add(qucker: mallardDuck)
            flock.add(qucker: redheadDuck)
            flock.add(qucker: duckCall)
            flock.add(qucker: rubberDuck)
            flock.add(qucker: gooseDuck)
            flock.quack()
        }
        
        static func simulate(duck: Quackable) {
            duck.quack()
        }
        
        
    }
    
    
    
    class Flock: Quackable {
        
        var observable: DuckObservable?
        private var quackers: [Quackable]?
        
        init(_ name: String) {
        }
        
        convenience init() {
            self.init("Flock")
            quackers = [Quackable]()
            observable = DuckObservable(withDuck: self)
        }
        
        func add(qucker: Quackable) {
            quackers?.append(qucker)
        }
        
        func quack() {
            quackers?.forEach { (qucker) in
                qucker.quack()
            }
        }
        
        func registerObserver(observer: DuckObserver) {
            quackers?.forEach({ (quack) in
                quack.registerObserver(observer: observer)
            })
        }
        
        func notifyObservers() { }
    }
    
    // 统计鸭子叫声次数
    
    class QuackCounter: Quackable {
        static var numberOfQuacks: Int = 0
        var duck: Quackable?
        var observable: DuckObservable?

        init() {
        }
        
        convenience init(withDuck duck: Quackable) {
            self.init()
            self.duck = duck
            observable = DuckObservable(withDuck: self)
        }
        
        func quack() {
            duck?.quack()
            QuackCounter.numberOfQuacks += 1
        }
        
        func registerObserver(observer: DuckObserver) {
            duck?.registerObserver(observer: observer)
        }
        
        func notifyObservers() {
            duck?.notifyObservers()
        }
        
        static func quacks() -> Int {
            return numberOfQuacks
        }
    }
    
    // MARK: - 鸭子工厂
    
    class AbstractDuckFactory {
        func createMallardDuck() -> Quackable {
            fatalError("sub behivior")
        }
        
        func createRedheadDuck() -> Quackable {
            fatalError("sub behivior")
        }
        
        func createDuckCall() -> Quackable {
            fatalError("sub behivior")
        }
        
        func createRubberDuck() -> Quackable {
            fatalError("sub behivior")
        }
        
        func createGoose() -> Quackable {
            fatalError("sub behivior")
        }
    }
    
    class DuckFactory: AbstractDuckFactory {
        override func createMallardDuck() -> Quackable {
            return MallardDuck()
        }
        
        override func createRedheadDuck() -> Quackable {
            return RedheadDuck()
        }
        
        override func createDuckCall() -> Quackable {
            return DuckCall()
        }
        
        override func createRubberDuck() -> Quackable {
            return RubberDuck()
        }
    }
    
    class CountingDuckFactory: AbstractDuckFactory {
        override func createMallardDuck() -> Quackable {
            return QuackCounter(withDuck: MallardDuck())
        }
        
        override func createRedheadDuck() -> Quackable {
            return QuackCounter(withDuck: RedheadDuck())
        }
        
        override func createDuckCall() -> Quackable {
            return QuackCounter(withDuck: DuckCall())
        }
        
        override func createRubberDuck() -> Quackable {
            return QuackCounter(withDuck: RubberDuck())
        }
        
        override func createGoose() -> Quackable {
            return QuackCounter(withDuck: GooseFacotry().createGoose())
        }
    }
    
    // MARK: - 鸭子
    class MallardDuck: Quackable {
        
        var observable: DuckObservable?
        
        init() {
            observable = DuckObservable(withDuck: self)
        }
        
    }
    
    class RedheadDuck: Quackable {
        var observable: DuckObservable?
        
        init() {
            observable = DuckObservable(withDuck: self)
            
        }
    }
    
    class DuckCall: Quackable {
        var observable: DuckObservable?
        
        init() {
            observable = DuckObservable(withDuck: self)
            
        }
        func quack() {
            print("Kwak")
        }
    }
    
    class RubberDuck: Quackable {
        var observable: DuckObservable?
        
        init() {
            observable = DuckObservable(withDuck: self)
            
        }
        func quack() {
            print("Squeak")
        }
    }
    
    
    
    // MARK: - 鹅类
    
    class GooseFacotry: AbstractDuckFactory {
        override func createGoose() -> Quackable {
            return GooseAdapter(withGoose: Goose())
        }
    }
    
    class Goose {
        func honk() {
            print("Honk")
        }
    }
    
    //  鹅类适配器
    class GooseAdapter: Quackable {
        var observable: DuckObservable?
        var goose: Goose?

        init() {
            
        }
        
        convenience init(withGoose goose: Goose) {
            self.init()
            self.goose = goose
            observable = DuckObservable(withDuck: self)
        }
        
        func quack() {
            goose?.honk()
        }
    }
}






