//
//  climbing-stairs.swift
//  leetcode
//
//  Created by tisfeng on 2020/10/29.
//

import Foundation

class ClimbStairs {
    var arr = [Int: Int]()
    func climbStairs(_ n: Int) -> Int {
        if n < 3 {
            arr[n] = n
            return n
        }
        
        if let count = arr[n] {
            return count
        }
        
        arr[n] = climbStairs(n - 1) + climbStairs(n - 2)
        print("arr[\(n)] = \(arr[n]!)")
        return arr[n]!
    }
}
