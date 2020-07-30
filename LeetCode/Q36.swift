//
//  Q36.swift
//  LeetCode
//
//  Created by Tim Ho on 2020/7/29.
//  Copyright © 2020 Tim Ho. All rights reserved.
//

import UIKit

class Q36: NSObject {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        if board.count != 9 {
            return false
        }
        
        var checkBoxs: [String: Bool] = [:]
        
        func checkOK(_ idx: Int, char: Character) -> Bool {
            
            let newKey = "\(idx)\(char)"
            if checkBoxs[newKey] == nil {
                checkBoxs[newKey] = true
            } else {
                return false
            }
            
            return true
        }
        
        for idxY in 0 ..< 9 {
            let aryRow = board[idxY]
            if aryRow.count != 9 {
                return false
            }
            
            for idxX in 0 ..< 9 {
                
                let char = aryRow[idxX]
                if char == "." {
                    continue
                }
                
                let idx1 = idxY
                let idx2 = idxX + 9
                let idx3 = idxX / 3 + (idxY / 3 * 3) + 18
                
                if checkOK(idx1, char: char) == false
                    || checkOK(idx2, char: char) == false
                    || checkOK(idx3, char: char) == false {
                    return false
                }
            }
        }
        
        return true
    }
}
