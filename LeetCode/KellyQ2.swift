//
//  KellyQ2.swift
//  LeetCode
//
//  Created by Tim Ho on 2019/2/25.
//  Copyright © 2019年 Tim Ho. All rights reserved.
//

import UIKit

class KellyQ2: NSObject {
    
    static func Question() -> ManyChildNode {
        let A = ManyChildNode.init(v: "A")
        let C = ManyChildNode.init(v: "C")
        let K = ManyChildNode.init(v: "K")
        let D = ManyChildNode.init(v: "D")
        let B = ManyChildNode.init(v: "B")
        let H = ManyChildNode.init(v: "H")
        let E = ManyChildNode.init(v: "E")
        let X = ManyChildNode.init(v: "X")
        let Y = ManyChildNode.init(v: "Y")
        let Z = ManyChildNode.init(v: "Z")
        let F = ManyChildNode.init(v: "F")
        
        A.next.append(C)
        C.next.append(K)
        K.next.append(D)
        C.next.append(D)
        D.next.append(B)
        B.next.append(C)
        
        A.next.append(H)
        H.next.append(Y)
        Y.next.append(Z)
        H.next.append(Z)
        Z.next.append(F)
        
        A.next.append(E)
        E.next.append(H)
        E.next.append(F)
        
        A.next.append(X)
        X.next.append(F)
        
        X.next.append(E)
        H.next.append(X)
        
        return A
    }
    
    func Solution(startNode: ManyChildNode, targetString: String) -> [String] {
        
        var aryString: [String] = []
        var result: [[ManyChildNode]] = []
        var tmp: [ManyChildNode] = []
        
        self.findRoute(nowResult: &result, thisLine: &tmp, node: startNode, targetString: targetString)
        
        for res in result {
            var ary: [String] = []
            for node in res {
                ary.append(node.value)
            }
            print("Cnt:\(ary.count) -> \(ary.joined(separator: ","))")
        }
        
        var minCount = -1
        for res in result {
            if res.count < minCount || minCount == -1 {
                aryString.removeAll()
                for node in res {
                    aryString.append(node.value)
                }
                minCount = aryString.count
//                print("Cnt:\(minCount) -> \(aryString.joined(separator: ","))")
            }
        }
        
        return aryString
    }
    
    func findRoute(nowResult: inout [[ManyChildNode]], thisLine: inout [ManyChildNode], node: ManyChildNode, targetString: String) {
        
        if thisLine.contains(node) {
//            nowResult.append(thisLine)
            return
        }
        
        if targetString == node.value {
            thisLine.append(node)
            nowResult.append(thisLine)
            return
        }
        
        for next in node.next {
            var line = thisLine
            line.append(node)
            findRoute(nowResult: &nowResult, thisLine: &line, node: next, targetString: targetString)
        }
    }
}
