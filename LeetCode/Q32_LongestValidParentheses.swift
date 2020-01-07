//
//  Q32_LongestValidParentheses.swift
//  LeetCode
//
//  Created by Tim Ho on 2020/1/7.
//  Copyright © 2020 Tim Ho. All rights reserved.
//

import UIKit

class Q32_LongestValidParentheses: NSObject {
    func longestValidParentheses(_ s: String) -> Int {
        // (((()())()((()()))
        // (())()()()((((())
        
        var maxLength = 0
        var resultDic: [Int: (nowPoint: Int, length: Int, readAddLength: Int)] = [:]
        for idx in 0 ..< s.count {
            let nowPoint = Array(s)[idx] == "(" ? 1 : -1
            
            if nowPoint == -1 {
                for info in resultDic {
                    if info.value.nowPoint < 0 {
                        continue
                    }
                    
                    let newPoint = info.value.nowPoint + nowPoint
                    if newPoint < 0 {
                        resultDic[info.key] = (-1, info.value.length, 0)
                        continue
                    } else if newPoint == 0 {
                        resultDic[info.key] = (newPoint, info.value.length + info.value.readAddLength + 2, 0)
                        maxLength = max(resultDic[info.key]?.length ?? 0, maxLength)
                    } else {
                        resultDic[info.key] = (newPoint, info.value.length, info.value.readAddLength + 2)
                    }
                }
            } else {
                var has1 = false
                for info in resultDic {
                    if info.value.nowPoint < 0 {
                        continue
                    }
                    
                    let newPoint = info.value.nowPoint + nowPoint
                    resultDic[info.key] = (newPoint, info.value.length, info.value.readAddLength)
                    if newPoint == 1 {
                        has1 = true
                    }
                }
                if has1 == false {
                    resultDic[idx] = (1, 0, 0)
                }
            }
        }
        
        return maxLength
    }
}
