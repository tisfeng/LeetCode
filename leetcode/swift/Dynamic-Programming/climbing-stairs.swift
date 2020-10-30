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
        
        arr[n] = climbStairs(n - 1) + climbStairs(n - 2)
        return arr[n]
    }
}


/**
 递归，内部函数
 
 执行用时：4 ms, 在所有 Swift 提交中击败了74.77%的用户
 内存消耗：13.3 MB, 在所有 Swift 提交中击败了64.26%的用户
 */
class ClimbStairs_74 {
    func climbStairs(_ n: Int) -> Int {
        var cache = [Int](repeating: 0, count: n + 1)
        
        func dfs(_ n: Int) -> Int {
            if cache[n] != 0 {
                return cache[n]
            }
            if n <= 2 {
                return n
            }
            cache[n] = dfs(n - 1) +  dfs(n - 2)
            
            return cache[n]
        }
        
        return dfs(n)
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


/**
 直接递归，超时
 */
class Solution0 {
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }
        return climbStairs(n - 1) + climbStairs(n - 2)
    }
}
