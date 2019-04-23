//
//  ProtocolDelegate.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/22.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

protocol PersonBean {
    
}


class PersonBeanImpl: NSObject {
    var name: String?
    var gender: String?
    var interests: String?
    var rating: Int?
    var ratingCount: Int?
    
    func invoke() {
        
    }
}
