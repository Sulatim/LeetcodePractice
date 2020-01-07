//
//  KellyQ1.swift
//  LeetCode
//
//  Created by Tim Ho on 2019/2/25.
//  Copyright © 2019年 Tim Ho. All rights reserved.
//

import UIKit

class KellyQ1: NSObject {
    static func QuestionNode() -> TreeNode {
        let node = TreeNode.init(v: 1)
        node.left = TreeNode.init(v: 2)
        node.right = TreeNode.init(v: 3)
        
        node.left?.left = TreeNode.init(v: 4)
        node.left?.right = TreeNode.init(v: 5)
        
        return node
    }
    
    func Solution(root: TreeNode) -> [Int] {
        var result: [Int] = []
        self.findResult(node: root, result: &result)
        
        return result
    }
    
    func findResult(node: TreeNode, result: inout [Int]) {
        if let left = node.left {
            self.findResult(node: left, result: &result)
        }
        result.append(node.value)
        if let right = node.right {
            self.findResult(node: right, result: &result)
        }
    }
}
