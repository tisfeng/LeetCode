//
//  guess-number-higher-or-lower-ii.swift
//  leetcode
//
//  Created by isfeng on 2020/9/15.
//

import Foundation

class Solution {
    func getMoneyAmount(_ n: Int) -> Int { // [1,2,3,4,5,6,7,8,9] 8 --> 5,7,9
        var money = 0
        var start = 0
        
        if n <= 3 {
            switch n {
            case 1:
                return 1
            case 2:
                return 1
            default:
                return 2
            }
        }
        
        repeat {
            let mid = (start + n) / 2
            print("start=\(start), end=\(n), mid=\(mid)")
            money += mid
            start = mid
        } while n - start > 1
        
        return money
    }
}
