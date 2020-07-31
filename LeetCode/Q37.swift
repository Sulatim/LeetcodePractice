//
//  Q37.swift
//  LeetCode
//
//  Created by Tim Ho on 2020/7/31.
//  Copyright © 2020 Tim Ho. All rights reserved.
//

import UIKit

class Q37: NSObject {
    
    class SudokuBox: NSObject {
        var value: Character = "."
        private var okArray: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        var g1: [SudokuBox] = []
        var g2: [SudokuBox] = []
        var g3: [SudokuBox] = []
        
        override init() {
        }
        
        func setChar(_ char: Character) {
            if char == "." {
                return
            }
            
            value = char
            for group in [g1, g2, g3] {
                for item in group {
                    if item == self || item.value != "." {
                        continue
                    }
                    
                    remove(val: char)
                }
            }
        }
        
        func remove(val: Character) {
            okArray.removeAll(where: { $0 == val })
            
            if okArray.count == 1, let lastOK = okArray.first {
                self.setChar(lastOK)
            }
        }
    }
    
    func solveSudoku(_ board: inout [[Character]]) {
        var allBox: [SudokuBox] = []
        var boxGroups: [Int: [SudokuBox]] = [:]
        
        func addToBox(_ box: SudokuBox, idx: Int) {
            var nowGroup = boxGroups[idx]
            if nowGroup == nil {
                nowGroup = [box]
            } else {
                nowGroup?.append(box)
            }
            
            guard let nG = nowGroup else {
                return
            }
            
            boxGroups[idx] = nowGroup
            
            if idx < 9 {
                box.g1 = nG
            } else if idx < 18 {
                box.g2 = nG
            } else {
                box.g3 = nG
            }
        }
        
        for yArray in board.enumerated() {
            for charInfo in yArray.element.enumerated() {
                
                let idx1 = yArray.offset
                let idx2 = charInfo.offset + 9
                let idx3 = charInfo.offset / 3 + (yArray.offset / 3 * 3) + 18
                
                let box = SudokuBox.init()
                
                addToBox(box, idx: idx1)
                addToBox(box, idx: idx2)
                addToBox(box, idx: idx3)
                
                allBox.append(box)
            }
        }
        
        for yArray in board.enumerated() {
            for charInfo in yArray.element.enumerated() {
                let idx = yArray.offset * 9 + charInfo.offset
                
                allBox[idx].setChar(charInfo.element)
            }
        }
        
        
    }
}
