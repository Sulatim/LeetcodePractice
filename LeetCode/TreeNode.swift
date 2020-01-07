//
//  TreeNode.swift
//  LeetCode
//
//  Created by Tim Ho on 2019/2/25.
//  Copyright © 2019年 Tim Ho. All rights reserved.
//

import UIKit

class TreeNode: NSObject {
    var value: Int = 0
    var left: TreeNode?
    var right: TreeNode?
    
    init(v: Int) {
        value = v
    }
}
