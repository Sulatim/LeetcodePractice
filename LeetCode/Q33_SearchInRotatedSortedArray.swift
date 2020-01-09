//
//  Q33_SearchInRotatedSortedArray.swift
//  LeetCode
//
//  Created by Tim Ho on 2020/1/9.
//  Copyright © 2020 Tim Ho. All rights reserved.
//

import UIKit

/*
 Example 1:
    Input: nums = [4,5,6,7,0,1,2], target = 0
    Output: 4

 
 Example 2:
    Input: nums = [4,5,6,7,0,1,2], target = 3
    Output: -1
 */

class Q33_SearchInRotatedSortedArray: NSObject {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return -1
        }
        return bSearch(nums: nums, target: target, lIndex: 0, rIndex: nums.count - 1)
    }
    
    func bSearch(nums: [Int], target: Int, lIndex: Int, rIndex: Int) -> Int {
        let mIndex = (lIndex + rIndex) / 2
        if mIndex <= nums.count {
            return -1
        }
        let midNum = nums[mIndex]
        
        if lIndex == mIndex {
            if midNum == target {
                return lIndex
            }
            return -1
        }
        
        if midNum == target {
            return mIndex
        }
        
        if midNum < target {
            let rightNum = nums[rIndex]
            if rightNum > midNum {
                // target = 5
                //[12,0,2,4,6,8,10]
                if rightNum > target {
                    return bSearch(nums: nums, target: target, lIndex: mIndex, rIndex: rIndex)
                } else if rightNum == target {
                    return rIndex
                } else {
                    let leftNum = nums[lIndex]
                    if rightNum < leftNum {
                        return bSearch(nums: nums, target: target, lIndex: lIndex, rIndex: mIndex - 1)
                    }
                    return -1
                }
            } else {
                // target = 9
                //[2,4,6,8,10,12,0]
                return bSearch(nums: nums, target: target, lIndex: mIndex, rIndex: rIndex)
            }
        } else {
            let leftNum = nums[lIndex]
            // target = 0
            if leftNum < midNum {
                //[4,5,6,7,0,1,2]
                if leftNum < target {
                    return bSearch(nums: nums, target: target, lIndex: lIndex, rIndex: mIndex)
                } else if leftNum == target {
                    return lIndex
                } else {
                    let rightNum = nums[rIndex]
                    if rightNum < leftNum {
                        return bSearch(nums: nums, target: target, lIndex: mIndex + 1, rIndex: rIndex)
                    }
                    return -1
                }
            } else {
                //[12,0,2,4,6,8,10]
                return bSearch(nums: nums, target: target, lIndex: lIndex, rIndex: mIndex)
            }
        }
    }
}
