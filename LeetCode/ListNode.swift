//
//  DM.swift
//  LeetCode
//
//  Created by Tim Ho on 2019/1/29.
//  Copyright © 2019年 Tim Ho. All rights reserved.
//

import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    static func printNode(node: ListNode?) {
        var tmp = node
        var str = ""
        while tmp != nil {
            if str != "" {
                str += ", "
            }
            str += "\(tmp!.val)"
            tmp = tmp?.next
        }
        print(str)
    }
}
