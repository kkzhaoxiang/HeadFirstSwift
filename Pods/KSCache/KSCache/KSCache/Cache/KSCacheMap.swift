//
//  KSCacheNode.swift
//  KSCache
//
//  Created by 疯狂的石头 on 2018/11/1.
//  Copyright © 2018 疯狂的石头. All rights reserved.
//

import Foundation

class KSCacheNode: NSObject {
    
    weak var prev: KSCacheNode?
    weak var next: KSCacheNode?
    var key: String
    var value: Any?
    var size: Int = 0
    // recoder timer
    var recoderTime: TimeInterval
    
    override init() {
        recoderTime = 0
        key = ""
        super.init()
    }
}

class KSCacheMap{
    
    var count: Int = 0
    var size: Int = 0
    private var head: KSCacheNode?
    private var tail: KSCacheNode?
    private var map: [String: KSCacheNode]
    
    init() {
        map = [String: KSCacheNode]()
    }
}

extension KSCacheMap {
    
    // add a node
    func insert(node: KSCacheNode) {
        if map.keys.contains(node.key) {
            bringToHeader(node: node, for: node.key)
        } else {
            if head != nil {
                head?.prev = node
                node.next = head
                head = node
            } else {
                head = node
                tail = node
            }
            count += 1
            node.size = MemoryLayout.stride(ofValue: node)
            size += node.size
        }
        
        map[node.key] = node
    }
    
    func object(forKey key: String) -> Any? {
        return map[key]?.value
    }
    
    // bring node to header
    func bringToHeader(node: KSCacheNode, for key: String) {
        
        if node == head { return }
        
        if (head != nil) {
            node.prev?.next = node.next
            node.next?.prev = node.prev
            head?.prev = node
            node.next = head
            head = node
        } else {
            head = node
            tail = node
            map[key] = node
            count += 1
            node.size = MemoryLayout.stride(ofValue: node)
            size += node.size
        }
    }
}

extension KSCacheMap {
    func contain(cacheKey key: String?) ->  Bool {
        guard let key = key else {
            return false
        }
        return map.keys.contains(key)
    }
}

extension KSCacheMap {
    @discardableResult
    func remove(forKey key: String) -> Any? {
        let node = map[key]
        if head == node {
            head = nil
            count = 0
            size = 0
        } else if tail == node {
            tail = node!.prev
            size -= node!.size
        } else {
            size -= node!.size
            node?.prev?.next = node?.next
        }
        map.removeValue(forKey: key)
        return node
    }
    
    @discardableResult
    func removeLast() -> KSCacheNode? {
        if count == 0 { return nil }
        
        if head == tail {
            let lastNode = head
            map.removeValue(forKey: lastNode!.key)
            head = nil
            tail = nil
            count -= 1
            size -= lastNode!.size
            return lastNode
        } else {
            let lastNode = tail
            map.removeValue(forKey: lastNode!.key)
            tail = tail?.prev
            tail?.next = nil
            count -= 1
            size -= lastNode!.size
            return lastNode
        }
    }
    
    func removeAll() {
        map.removeAll()
        head = nil
        tail = nil
        count = 0
        size = 0
    }
}

extension KSCacheMap {
    
    func orderPrint() {
        var node = head
        
        while node != nil {
            print(node?.value ?? "no valiable value")
            node = node?.next
        }
    }
    
    func disorderPrint() {
        map.forEach { (_, node) in
            print(node.value ?? "no valiable value")
        }
    }
}
