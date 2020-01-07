//
//  ManyChildNode.swift
//  LeetCode
//
//  Created by Tim Ho on 2019/2/25.
//  Copyright © 2019年 Tim Ho. All rights reserved.
//

import UIKit

class ManyChildNode: NSObject {
    var value: String!
    var next: [ManyChildNode] = []
    
    init(v: String) {
        value = v
    }
}
