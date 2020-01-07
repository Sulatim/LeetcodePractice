//
//  Q30.swift
//  LeetCode
//
//  Created by Tim Ho on 2019/3/15.
//  Copyright © 2019年 Tim Ho. All rights reserved.
//

import UIKit

class Q30: NSObject {
    
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        if words.count == 0 || s.count == 0 {
            return []
        }
        
        let wordSize = words[0].count
        let windowSize = wordSize * words.count
        
        if s.count < windowSize {
            return []
        }
        
        // Build a counted set for words
        var wordCounts: [String: Int] = [:]
        words.forEach { wordCounts[$0, default: 0] += 1}
        
        let chars = Array(s) // substring is extremly slow, so use character array here
        var result: [Int] = []
        
        for idx in 0 ..< wordSize  {
            
            var left = idx
            var right = idx
            var nowWordCounts = wordCounts
            var found = 0
            while left + windowSize <= s.count {
                let nowWord = String(chars[right..<right + wordSize])
                
                if let count = nowWordCounts[nowWord] {
                    nowWordCounts[nowWord] = count - 1
                    if count == 1 {
                        found += 1
                    }
                }
                
                if found == wordCounts.count {
                    result.append(left)
                }
                right += wordSize
                
                if right - left != windowSize {
                    continue
                }
                
                let head = String(chars[left..<left + wordSize])
                if let count = nowWordCounts[head] {
                    nowWordCounts[head] = count + 1
                    if count == 0 {
                        found -= 1
                    }
                }
                left += wordSize
            }
        }
        
        
        return result
    }
    
    
    func findSubstringSample(_ s: String, _ words: [String]) -> [Int] {
        if words.count == 0 || s.count == 0 {
            return []
        }
        
        let wordSize = words[0].count
        let windowSize = wordSize * words.count
        
        if s.count < windowSize {
            return []
        }
        
        // Build a counted set for words
        var wordCounts: [String: Int] = [:]
        words.forEach { wordCounts[$0, default: 0] += 1}
        
        let chars = Array(s) // substring is extremly slow, so use character array here
        var result: [Int] = []
        for i in 0..<wordSize {
            var left = i
            var right = i
            var counts: [String: Int] = wordCounts
            var found = 0
            while right <= chars.count - wordSize {
                let word = String(chars[right..<right + wordSize])
                right += wordSize
                if let count = counts[word] {
                    counts[word] = count - 1
                    if count == 1 {
                        found += 1
                    }
                }
                
                if found == counts.count {
                    result.append(left)
                }
                
                guard right - left == windowSize else { continue }
                let head = String(chars[left..<left + wordSize])
                if let count = counts[head] {
                    counts[head] = count + 1
                    if count == 0 {
                        found -= 1
                    }
                }
                left += wordSize
            }
        }
        return result
    }
    
    //Time out too
    func findSubstring2(_ s: String, _ words: [String]) -> [Int] {
        
        var tmpStringDic: [Int: [String]] = [:]
        guard let firstWord = words.first else {
            return []
        }
        
        var result: [Int] = []
        
        for idx in 0 ..< firstWord.count {
            var strFull = s.substring(from: String.Index.init(encodedOffset: idx))
            var aryAllOfIndex: [String] = []
            while strFull.count > firstWord.count {
                aryAllOfIndex.append(strFull.substring(to: String.Index.init(encodedOffset: firstWord.count)))
                strFull = strFull.substring(from: String.Index.init(encodedOffset: firstWord.count))
            }
            tmpStringDic[idx] = aryAllOfIndex
            
            compareArray(aryAll: aryAllOfIndex, words: words, idxStart: idx, result: &result)
        }
        
        return result
    }
    
    func compareArray(aryAll: [String], words: [String], idxStart: Int, result: inout [Int]) {
        
        for idx in 0 ..< aryAll.count {
            var tmpWords = words
            var subIdx = 0
            while tmpWords.count > 0 {
                let newIdx = subIdx + idx
                if newIdx >= aryAll.count {
                    break
                }
                let strNow = aryAll[newIdx]
                if tmpWords.contains(strNow) {
                    subIdx += 1
                    let idxTmp = tmpWords.index(of: strNow)!
                    tmpWords.remove(at: idxTmp)
                    if tmpWords.count == 0 {
                        result.append(idx * strNow.count + idxStart)
                        break
                    }
                    continue
                } else {
                    break
                }
                
            }
        }
    }
    
    //Time out
    func findSubstring1(_ s: String, _ words: [String]) -> [Int] {
        
        var result: [Int] = []
        
        var nStartIndex = 0
        var strFull = s
        while true {
            let tmp = checkHasNext(strFull: strFull, words: words, isFirstLayer: true, nowIndex: nStartIndex)
            if tmp.0 == false {
                break
            }
            
            result.append(tmp.1)
            nStartIndex = tmp.1 + 1
            strFull = s.substring(from: String.Index.init(encodedOffset: nStartIndex))
        }
        
        return result
    }
    
    func checkHasNext(strFull: String, words: [String], isFirstLayer: Bool, nowIndex: Int) -> (Bool, Int) {
        guard let firstWord = words.first else {
            return (false, 0)
        }
        
        if firstWord.count * words.count > strFull.count {
            return (false, 0)
        }
        
        let firstPart = strFull.substring(to: String.Index.init(encodedOffset: firstWord.count))
        
        if words.contains(firstPart) == false {
            if isFirstLayer {
                return checkHasNext(strFull:strFull.substring(from: String.Index.init(encodedOffset: 1)), words:words, isFirstLayer: true, nowIndex: nowIndex + 1)
            }
            
            return (false, 0)
        }
        
        var newWords = words
        newWords.remove(at: newWords.index(of: firstPart)!)
        
        if newWords.count == 0 {
            return (true, nowIndex)
        }
        
        let tmpResult = checkHasNext(strFull:strFull.substring(from: String.Index.init(encodedOffset: firstPart.count)), words:newWords, isFirstLayer: false, nowIndex: nowIndex)
        if tmpResult.0 {
            return tmpResult
        }
        
        if isFirstLayer {
            return checkHasNext(strFull:strFull.substring(from: String.Index.init(encodedOffset: 1)), words:words, isFirstLayer: true, nowIndex: nowIndex + 1)
        }
        
        return (false, 0)
    }
}
