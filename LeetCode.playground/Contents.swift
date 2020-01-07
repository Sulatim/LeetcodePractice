import UIKit

func nextPermutation(_ nums: inout [Int]) {
    var tmpNums: [Int] = []
    var lastNums: Int?
    
    for idx in 0 ..< nums.count {
        let newIdx = nums.count - 1 - idx
        let newNum = nums[newIdx]
        
        guard let last = lastNums else {
            tmpNums.append(newNum)
            lastNums = newNum
            continue
        }
        
        if last <= newNum {
            lastNums = newNum
            tmpNums.append(newNum)
            continue
        }
        
        tmpNums.append(newNum)
        
        if let next = tmpNums.first(where: { $0 > newNum }) {
            nums[newIdx] = next
            if let idx3 = tmpNums.firstIndex(of: next) {
                tmpNums.remove(at: idx3)
            }
            tmpNums.sort(by: { $0 < $1 })
            for idx2 in 0 ..< tmpNums.count {
                nums[newIdx + idx2 + 1] = tmpNums[idx2]
            }
        }
        
        return
    }
    
    for idx in 0 ..< nums.count / 2 {
        nums[idx] = nums[nums.count - idx - 1] + nums[idx]
        nums[nums.count - idx - 1] = nums[idx] - nums[nums.count - idx - 1]
        nums[idx] = nums[idx] - nums[nums.count - idx - 1]
    }
}

var ary1 = [1,4,5,7,1,3,2]
//1,2,5,1 >> 1,5,1,2
//1,3,7,6,5,4,1 >> 1,4,1,3,5,6,7
//1,3,2 >> 2,1,3
//1,4,5,7,1,3,2 >> 1,4,5,7,2,1,3
//3,2,1 >> 1,2,3

nextPermutation(&ary1)

print(ary1)
