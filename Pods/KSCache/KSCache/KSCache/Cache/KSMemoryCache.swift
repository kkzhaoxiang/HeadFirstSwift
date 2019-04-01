//
//  KSMemoryCache.swift
//  KSCache
//
//  Created by 疯狂的石头 on 2018/11/1.
//  Copyright © 2018 疯狂的石头. All rights reserved.
//

import Foundation
import UIKit

class KSMemoryCache {
    static let shared = KSMemoryCache()
    
    enum CleanStrategy {
        case none
        case count
        case size
        case time
    }
    
    
    struct CleanStrategySet: OptionSet {
        let rawValue: Int
        
        static let none = CleanStrategySet(rawValue: 1 << 0)
        static let count = CleanStrategySet(rawValue: 1 << 1)
        static let size = CleanStrategySet(rawValue: 1 << 2)
        static let time = CleanStrategySet(rawValue: 1 << 3)
        static let all: CleanStrategySet = [.count, .size, .time]
    }

    var cleanStrategy: KSMemoryCache.CleanStrategy
    var cleanStrategySet: KSMemoryCache.CleanStrategySet
    var maxCount: Int
    var maxSize: Int
    var maxTime: Double
    
    var count: Int {
        return map.count
    }
    
    var size: Int {
        return map.size
    }

    private var map: KSCacheMap
    private var lock: NSLock

    init() {
        lock = NSLock()
        map = KSCacheMap()
        cleanStrategy = .none
        maxCount = .max
        maxSize = .max
        maxTime = .greatestFiniteMagnitude
        cleanStrategySet = [.none]
        NotificationCenter.default.addObserver(self, selector: #selector(memoryWaring), name: UIApplication.didReceiveMemoryWarningNotification, object: nil)
    }
    
    // add obj
    func setObject(_ obj: Any?, for key: String?) {

        lock.lock()
        
        guard let key = key else {  return  }
        guard let obj = obj else {
            map.remove(forKey: key)
            return
        }
        
        switch cleanStrategy {
        case .count:
            if map.count >= maxCount {
                map.removeLast()
                map.count -= 1
            }
        case .size:
            if map.size > maxSize {
                let node = map.removeLast()
                map.size -= node?.size ?? 0
            }
        default:
            break
        }
        
        let node = KSCacheNode()
        node.value = obj
        node.key = key
        map.insert(node: node)
        
        lock.unlock()
    }
    
    func object(for key: String) -> Any? {
        lock.lock()
        let data = map.object(forKey: key)
        lock.unlock()
        return data
    }
    
}

extension KSMemoryCache {
    func contain(cacheKey key: String?) -> Bool {
        var bool: Bool = false
        lock.lock()
        bool = map.contain(cacheKey:key)
        lock.unlock()
        return bool
    }
}

extension KSMemoryCache {
    func clearMemory() {
        DispatchQueue.global().async {
            self.lock.lock()
            self.map.removeAll()
            self.map.count = 0
            self.map.size = 0
            self.lock.unlock()
        }
    }
    
    @objc
    private
    func memoryWaring() {
        let node = map.removeLast()
        
        switch cleanStrategy {
        case .count:
             map.count -= 1
        case .size:
            map.size -= node?.size ?? 0
        default:
            break
        }
    }
}

extension KSMemoryCache {
    func orderPrint() {
        map.orderPrint()
    }
    
    func disorderPrint() {
        map.disorderPrint()
    }
}
