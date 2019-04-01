//
//  KSManager.swift
//  KSCache
//
//  Created by 疯狂的石头 on 2018/11/2.
//  Copyright © 2018 疯狂的石头. All rights reserved.
//

import Foundation

struct KSImageManager<Base> {
    let base: Base
    init(_ base: Base) {
        self.base = base
    }
    
//    var cache: KSMemoryCache {
//        return KSDownloadManager.manager.cache
//    }
    
    var cache: KSMemoryCache {
        return KSDownloadManager.manager.cache
    }
}

protocol KSCompatible {
    associatedtype KSCompatibleType
    var ks: KSImageManager<KSCompatibleType> { get }
}

extension KSCompatible {
    var ks: KSImageManager<Self> {
        return KSImageManager(self)
    }
}

enum ImageSource {
    case cache
    case download
}


