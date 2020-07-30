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
        
        return search(nums, target, lIndex: 0, rIndex: nums.count - 1)
    }
    
    // 先切一半 - m
    // 再一半 - 比如右邊，可能大可能小
    //
    /*
     f m l, target；l < f
     m < l or f > m: m~l是連續
        t > m -> 很好，m~l bsearch
        t < m -> 重複上頭
     m > l or f < m: 表示f~m是個連續段
        t > m -> 重複
        t < m -> 很好 f~m bsearch
     */
    
    func search(_ nums: [Int], _ target: Int, lIndex: Int, rIndex: Int) -> Int {
        
        if nums.count == 0 {
            return -1
        }
        
        if nums.count == 1 {
            if target != nums[0] {
                return -1
            }
            
            return 0
        }
        
        if rIndex - lIndex < 0 || lIndex < 0 || nums.count <= rIndex {
            return -1
        }
        
        let first = nums[lIndex]
        let last = nums[rIndex]
        
        let midIndex = (lIndex + rIndex) / 2
        let mid = nums[midIndex]
        
        if mid == target {
            return midIndex
        } else if first == target {
            return lIndex
        } else if last == target {
            return rIndex
        }
        
        func top() -> Int {
            return search(nums, target, lIndex: midIndex + 1, rIndex: rIndex - 1)
        }
        
        func bottom() -> Int {
            return search(nums, target, lIndex: lIndex + 1, rIndex: midIndex - 1)
        }
        
        if last > first {
            // bSearch
            if mid < target {
                return top()
            } else {
                return bottom()
            }
        }
        
        if target > mid {
            if mid < last {
                if target < last {
                    return top()
                }
                
                return bottom()
            }
            
            return top()
        }
        
        if mid > first {
            if target > first {
                return bottom()
            }
            
            return top()
        }
        
        return bottom()
    }
}
