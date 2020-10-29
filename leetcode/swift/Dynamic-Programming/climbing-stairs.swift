//
//  climbing-stairs.swift
//  leetcode
//
//  Created by tisfeng on 2020/10/29.
//

import Foundation

/**
 递归，数组保存
 
 执行用时：4 ms, 在所有 Swift 提交中击败了75.39%的用户
 内存消耗：13.4 MB, 在所有 Swift 提交中击败了56.93%的用户
 */
class ClimbStairs {
    var arr = Array(repeating: 0, count: 100)
    func climbStairs(_ n: Int) -> Int {
        if n < 3 {
            arr[n] = n
            return n
        }
        
        if arr[n] != 0 {
            return arr[n]
        }
        
        let count = climbStairs(n - 1) + climbStairs(n - 2)
        arr[n] = count
        print("arr[\(n)] = \(arr[n])")
        return count
    }
}

/**
 递归，字典保存

 执行用时：4 ms, 在所有 Swift 提交中击败了75.39%的用户
 内存消耗：13.5 MB, 在所有 Swift 提交中击败了56.93%的用户
 */
class ClimbStairs_75 {
    var map = [Int: Int]()
    func climbStairs(_ n: Int) -> Int {
        if n < 3 {
            map[n] = n
            return n
        }
        
        if let count = map[n] {
            return count
        }
        
        let count = climbStairs(n - 1) + climbStairs(n - 2)
        map[n] = count
        print("map[\(n)] = \(map[n]!)")
        return count
    }
}


class Solution0 {
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }
        return climbStairs(n - 1) + climbStairs(n - 2)
    }
}
