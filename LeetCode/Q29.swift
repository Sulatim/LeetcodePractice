//
//  Q29.swift
//  LeetCode
//
//  Created by Tim Ho on 2019/1/29.
//  Copyright © 2019年 Tim Ho. All rights reserved.
//

import UIKit

class Q29: NSObject {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend == 0 {
            return 0
        }
        
        let isNav = (dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0)
        
        let strDend = "\(dividend)".replacingOccurrences(of: "-", with: "") as NSString
        let nSor = Int("\(divisor)".replacingOccurrences(of: "-", with: ""))!
        
        var nTmpDividend = 0
        var nResult = 0
        
        for idx in 0 ..< strDend.length {
            let strN = strDend.substring(with: NSRange.init(location: idx, length: 1))
            
            nTmpDividend = nTmpDividend * 10 + (Int(strN) ?? 0)
            nResult = nResult * 10
            if nTmpDividend < nSor {
                continue
            }
            
            while nTmpDividend >= nSor {
                nTmpDividend -= nSor
                nResult += 1
            }
        }
        
        nResult = isNav ? -nResult : nResult
        return isNav ? max(nResult, Int(Int32.min)) : min(nResult, Int(Int32.max))
        
    }
}
