//
//  minimum-increment-to-make-array-unique.swift
//  leetcode
//
//  Created by tisfeng on 2020/12/5.
//

import Foundation

/**
 945. 使数组唯一的最小增量    https://leetcode-cn.com/problems/minimum-increment-to-make-array-unique/
 
 输入：[1,2,2]
 输出：1
 
 输入：[3,2,1,2,1,7]
 输出：6
 
 [3,2,1,2,1,7]
 
 [1,1,2,2,3,7]
 
 [1,2,3,4,5,7]
 */


/**
 思路:
 
 1. 将数组排序；
 2. 遍历，将元素逐个和之前的元素比较，保证新的数组元素递增。
 
 执行用时：652 ms, 在所有 Swift 提交中击败了100.00%的用户
 内存消耗：15.4 MB, 在所有 Swift 提交中击败了100.00%的用户
 */
class Solution {
    func minIncrementForUnique(_ A: [Int]) -> Int {
        var sortedA = A.sorted()
        let len = A.count
        var increment = 0
        
        for i in 0..<len {
            if i > 0 && sortedA[i] <= sortedA[i-1] {
                let old = sortedA[i]
                sortedA[i] = sortedA[i-1] + 1
                increment += sortedA[i] - old
            }
        }
        
        return increment
    }
}


/**
 超时
 */
class Solution_00 {
    func minIncrementForUnique(_ A: [Int]) -> Int {
        let len = A.count
        var map = [Int: Int]()
        var increment = 0
        for i in 0..<len {
            let value = A[i]
            if map[A[i]] == nil {
                map[value] = i
            } else {
                var new = value
                repeat {
                    new += 1
                } while map[new] != nil
                
                map[new] = i
                increment += new - value
            }
        }
        
        return increment
    }
}
