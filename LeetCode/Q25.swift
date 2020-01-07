//
//  Q25.swift
//  LeetCode
//
//  Created by Tim Ho on 2019/1/29.
//  Copyright © 2019年 Tim Ho. All rights reserved.
//

import UIKit

class Q25 {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var lst: [ListNode] = []
        
        var result: ListNode? = nil
        var nowNode: ListNode? = head
        var lastNode: ListNode? = nil
        while nowNode != nil {
            lst.append(nowNode!)
            nowNode = nowNode?.next
            if lst.count == k {
                for idx in 0 ..< k {
                    let node = lst[k - idx - 1]
                    if result == nil && idx == 0 {
                        result = node
                    }
                    
                    lastNode?.next = node
                    lastNode = node
                    node.next = nil
                }
                lst.removeAll()
            }
            if lastNode?.next == nil {
                lastNode?.next = nowNode
            }
        }
        
        if result == nil {
            result = head
        }
        
        return result
    }
}
