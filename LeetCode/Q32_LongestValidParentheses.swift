//
//  Q32_LongestValidParentheses.swift
//  LeetCode
//
//  Created by Tim Ho on 2020/1/7.
//  Copyright © 2020 Tim Ho. All rights reserved.
//

import UIKit

class Q32_LongestValidParentheses: NSObject {
    
    /*
     (
     ((
     (() >> 2
     (()( >> 2
     (()(( >> 2
     (()((( >> 2
     (()(((( >> 2
     (()(((() >> 2
     (()(((()) >> 4
     (()(((())) >> 6
     (()(((()))) >> 10
     (()(((())))) >> 12

     2:0
     1:2
     1,1:2,0
     1,4:2,0
     1,3:2,2
     1,1:2,6
     1:10
     0:12
     */
    
    
    func longestValidParentheses(_ s: String) -> Int {
        
        var maxLength = 0
        var numsArray: [Int] = []
        var totalsArray: [Int] = []
        let tmpArray = Array(s)
        for idx in 0 ..< s.count {
            if tmpArray[idx] == ")" {
                guard let right = numsArray.last else {
                    continue
                }
                
                if right <= 0 {
                    numsArray = []
                    totalsArray = []
                    continue
                }
                
                let newRight = right - 1
                if newRight == 0, numsArray.count > 1 {
                    numsArray.removeLast()
                    let newTotal = totalsArray[totalsArray.count - 2] + totalsArray[totalsArray.count - 1] + 2
                    totalsArray[totalsArray.count - 2] = newTotal
                    totalsArray.removeLast()
                    maxLength = max(newTotal, maxLength)
                } else {
                    numsArray[numsArray.count - 1] = newRight
                    let newTotal = totalsArray[totalsArray.count - 1] + 2
                    totalsArray[totalsArray.count - 1] = newTotal
                    
                    maxLength = max(newTotal, maxLength)
                }
            } else {
                if let lastTotal = totalsArray.last, lastTotal == 0 {
                    numsArray[numsArray.count - 1] = numsArray[numsArray.count - 1] + 1
                    continue
                }
                numsArray.append(1)
                totalsArray.append(0)
            }
        }
        
        return maxLength
    }
    
//    func longestValidParentheses(_ s: String) -> Int {
//        // (((()())()((()()))
//        // (())()()()((((())
//        // (()(((()
//
//        var maxLength = 0
//        var lastResultInfo: (nowPoint: Int, length: Int, readAddLength: Int)?
//        let tmpArray = Array(s)
//        for idx in 0 ..< s.count {
//            let nowPoint = tmpArray[idx] == "(" ? 1 : -1
//
//            if nowPoint == -1 {
//                if let last = lastResultInfo {
//                    let newPoint = last.nowPoint + nowPoint
//
//                    if newPoint < 0 {
//                        lastResultInfo = nil
//                    } else if newPoint == 0 {
//                        lastResultInfo = (newPoint, last.length + last.readAddLength + 2, 0)
//                        maxLength = max(lastResultInfo!.length, maxLength)
//                    } else {
//                        lastResultInfo = (newPoint, last.length, last.readAddLength + 2)
//                        maxLength = max(lastResultInfo!.readAddLength, maxLength)
//                    }
//                }
//            } else {
//
//                if let last = lastResultInfo {
//                    let newPoint = last.nowPoint + nowPoint
//
//                    lastResultInfo = (newPoint, last.length, last.readAddLength)
//                } else {
//                    lastResultInfo = (1, 0, 0)
//                }
//            }
//        }
//
//        return maxLength
//    }
}
