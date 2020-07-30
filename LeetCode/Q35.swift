//
//  Q35.swift
//  LeetCode
//
//  Created by Tim Ho on 2020/5/19.
//  Copyright © 2020 Tim Ho. All rights reserved.
//

//Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
//
//You may assume no duplicates in the array.

import UIKit

class Q35: NSObject {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        return bSearch(nums, target, lIndex: 0, rIndex: nums.count - 1)
    }
    
    func bSearch(_ nums: [Int], _ target: Int, lIndex: Int, rIndex: Int) -> Int {
        
        if rIndex < 0 {
            return 0
        }
        
        if lIndex == rIndex {
            if lIndex < nums.count {
                let value = nums[lIndex]
                if target <= value {
                    return lIndex
                } else {
                    return lIndex + 1
                }
            }
        }
        
        if lIndex > rIndex || nums.count <= rIndex || lIndex < 0 {
            return 0
        }
        
        let midIndex = (lIndex + rIndex) / 2
        let midValue = nums[midIndex]
        
        if midValue < target {
            if rIndex == midIndex {
                return midIndex
            }
            return bSearch(nums, target, lIndex: midIndex + 1, rIndex: rIndex)
        } else if midValue > target {
            if lIndex == midIndex {
                return midIndex
            }
            return bSearch(nums, target, lIndex: lIndex, rIndex: midIndex - 1)
        }
        
        return midIndex
    }
}
