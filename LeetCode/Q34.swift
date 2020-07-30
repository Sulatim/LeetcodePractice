//
//  Q34.swift
//  LeetCode
//
//  Created by Tim Ho on 2020/5/19.
//  Copyright © 2020 Tim Ho. All rights reserved.
//

//Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
//
//Your algorithm's runtime complexity must be in the order of O(log n).
//
//If the target is not found in the array, return [-1, -1].


import UIKit

class Q34: NSObject {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        return searchRange(nums, target, lIndex: 0, rIndex: nums.count - 1)
    }
    
    private func searchRange(_ nums: [Int], _ target: Int, lIndex: Int, rIndex: Int, findLeft: Bool? = nil) -> [Int] {
        if(nums.count == 0 || rIndex >= nums.count || lIndex < 0 || lIndex > rIndex) {
            return [-1, -1]
        }
        
        let midIndex = (lIndex + rIndex) / 2
        let midValue = nums[midIndex]
        if midValue > target {
            return searchRange(nums, target, lIndex: lIndex, rIndex: midIndex - 1)
        } else if midValue < target {
            return searchRange(nums, target, lIndex: midIndex + 1, rIndex: rIndex)
        }
        
        guard let bLeft = findLeft else {
            var r1 = midIndex
            var r2 = midIndex
            let tlIndex = searchRange(nums, target, lIndex: lIndex, rIndex: midIndex, findLeft: true)
            let trIndex = searchRange(nums, target, lIndex: midIndex, rIndex: rIndex, findLeft: false)
            
            if let lTop = tlIndex.first, lTop != -1 {
                r1 = lTop
            }
            if let rTop = trIndex.last, rTop != -1 {
                r2 = rTop
            }
            
            return [r1, r2]
        }
        
        if bLeft {
            let tlIndex = searchRange(nums, target, lIndex: lIndex, rIndex: midIndex - 1, findLeft: bLeft)
            if let lTop = tlIndex.first, lTop != -1 {
                return [lTop, -1]
            } else {
                return [midIndex, -1]
            }
        } else {
            let trIndex = searchRange(nums, target, lIndex: midIndex + 1, rIndex: rIndex, findLeft: false)
            if let rTop = trIndex.last, rTop != -1 {
                return [-1, rTop]
            } else {
                return [-1, midIndex]
            }
        }
    }
}
