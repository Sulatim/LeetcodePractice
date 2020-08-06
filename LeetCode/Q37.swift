//
//  Q37.swift
//  LeetCode
//
//  Created by Tim Ho on 2020/7/31.
//  Copyright © 2020 Tim Ho. All rights reserved.
//

import UIKit

class Q37: NSObject {
    
    func solveSudoku(_ board: inout [[Character]]) {
        let _ = solve(&board, startIdx: 0)
    }
    
    func solve(_ board: inout [[Character]], startIdx: Int) -> Bool {
        var idx = startIdx
        while idx < 81 {
            let idxX = idx % 9
            let idxY = idx / 9
            
            let char = board[idxY][idxX]
            if char != "." {
                idx += 1
                continue
            }
            
            for v in "123456789" {
                if valid(board: board, x: idxX, y: idxY, v: v) == false {
                    continue
                }
                board[idxY][idxX] = v
                if solve(&board, startIdx: idx + 1) {
                    return true
                }
                board[idxY][idxX] = "."
            }
            return false
        }
        
        return true
    }
    
    func valid(board: [[Character]], x: Int, y: Int, v: Character) -> Bool {
        for m in 0 ..< 9 {
            if board[y][m] == v {
                return false
            }
            
            if board[m][x] == v {
                return false
            }
            
            let idxX = x / 3 * 3 + m % 3
            let idxY = y / 3 * 3 + m / 3
            if board[idxY][idxX] == v {
                return false
            }
        }
        
        return true
    }
    
    
    class SudokuBox: NSObject {
        var value: Int8 = 0
        private var okArray: [Int8] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        var gps: [[SudokuBox]] = []
        
        override init() {
        }
        
        func setValue(_ val: Int8) {
            if val == 0 {
                return
            }

            value = val
            for gp in gps {
                for box in gp {
                    if box == self {
                        continue
                    }
                    box.remove(val: value)
                }
            }
        }

        func remove(val: Int8) {
            let countOld = okArray.count
            if countOld == 0 {
                return
            }

            okArray.removeAll(where: { $0 == val })
        }
        
        func checkCanSet(val: Int8) -> Bool {
            
            if val == 0 {
                return false
            }
            
            return self.gps.contains { (gp) -> Bool in
                return gp.contains(where: { (box) -> Bool in
                    box.value == val
                })
            }
        }
    }
    
    
//
//    class SudokuBox: NSObject {
//        var value: Character = "."
//        private var okArray: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
//
//        var gps: [[SudokuBox]] = []
//
//        override init() {
//        }
//
//        func setChar(_ char: Character) {
//            if char == "." {
//                return
//            }
//
//            value = char
//            for gp in gps {
//                for box in gp {
//                    if box == self {
//                        continue
//                    }
//                    box.remove(val: value)
//                }
//            }
//        }
//
//        func remove(val: Character) {
//            let countOld = okArray.count
//            if countOld == 0 {
//                return
//            }
//
//            okArray.removeAll(where: { $0 == val })
//
//            let countNew = okArray.count
//            if countNew != countOld, countNew == 1, let lastOK = okArray.first {
//                self.setChar(lastOK)
//            }
//        }
//    }
//
//    func solveSudoku(_ board: inout [[Character]]) {
//        var allBox: [SudokuBox] = []
//        var boxGroups: [Int: [SudokuBox]] = [:]
//
//        func addToBox(_ box: SudokuBox, idx: Int) {
//            var nowGroup = boxGroups[idx]
//            if nowGroup == nil {
//                nowGroup = [box]
//            } else {
//                nowGroup?.append(box)
//            }
//
//            guard let nG = nowGroup else {
//                return
//            }
//
//            boxGroups[idx] = nG
//        }
//
//        for yArray in board.enumerated() {
//            for charInfo in yArray.element.enumerated() {
//
//                let idx1 = yArray.offset
//                let idx2 = charInfo.offset + 9
//                let idx3 = charInfo.offset / 3 + (yArray.offset / 3 * 3) + 18
//
//                let box = SudokuBox.init()
//
//                addToBox(box, idx: idx1)
//                addToBox(box, idx: idx2)
//                addToBox(box, idx: idx3)
//
//                allBox.append(box)
//            }
//        }
//
//        for yArray in board.enumerated() {
//            for charInfo in yArray.element.enumerated() {
//                let idx = yArray.offset * 9 + charInfo.offset
//
//                let idx1 = yArray.offset
//                let idx2 = charInfo.offset + 9
//                let idx3 = charInfo.offset / 3 + (yArray.offset / 3 * 3) + 18
//
//                let box = allBox[idx]
//                box.gps = [boxGroups[idx1]!, boxGroups[idx2]!, boxGroups[idx3]!]
//                box.setChar(charInfo.element)
//            }
//        }
//        printNowAnswer(all: allBox)
//
//        func singleCheck() {
//            // 直橫排搜是否有僅有三個以內的同數字在同排或同列，有的話把同大格的其他數字都砍掉
//            // 大格看有無三個數字在同排或同列，有的話把該列給砍了
//            for num in 1 ... 9 {
//                for groupIdx in 0 ... 26 {
//                    guard let group = boxGroups[groupIdx] else {
//                        continue
//                    }
//
//                    var aryTmpBoxes: [SudokuBox] = []
//                    for box in group {
//
//                    }
//
//                }
//            }
//        }
//
//        func crackDown(_ board: inout [[Character]]) {
//            var aryCheckIndex: [Int] = []
//
//            func checkValue() {
//
//            }
//
//            var idxNow = 0
//            while true {
//                let idxX = idxNow % 9
//                let idxY = idxNow / 9
//
//                let infoNow = board[idxY][idxX]
//                if infoNow != "." {
//                    idxNow += 1
//                    continue
//                }
//                aryCheckIndex.append(idxNow)
//
//            }
//        }
//    }
//
//
//
//    func printLine() {
//        print("========================")
//    }
//
//    func printNowAnswer(all: [SudokuBox]) {
//
//        var info = ""
//        for item in all.enumerated() {
//            var prefix = ""
//            if item.offset != 0 {
//                if item.offset % 9 == 0 {
//                    prefix = "],\n["
//                } else {
//                    prefix = ","
//                }
//            } else {
//                prefix = "["
//            }
//
//            info = "\(info)\(prefix)\"\(item.element.value)\""
//        }
//
//        print(info)
//    }
    
}
