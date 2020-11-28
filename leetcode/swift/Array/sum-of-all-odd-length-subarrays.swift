//
//  sum-of-all-odd-length-subarrays.swift
//  leetcode
//
//  Created by tisfeng on 2020/11/28.
//

import Foundation

/**
 1588. 所有奇数长度子数组的和 https://leetcode-cn.com/problems/sum-of-all-odd-length-subarrays/
 
 给你一个正整数数组 arr ，请你计算所有可能的奇数长度子数组的和。

 子数组 定义为原数组中的一个连续子序列。

 请你返回 arr 中 所有奇数长度子数组的和 。

 
 输入：arr = [1,4,2,5,3]
 输出：58
 解释：所有奇数长度子数组和它们的和为：
 [1] = 1
 [4] = 4
 [2] = 2
 [5] = 5
 [3] = 3
 [1,4,2] = 7
 [4,2,5] = 11
 [2,5,3] = 10
 [1,4,2,5,3] = 15
 我们将所有值求和得到 1 + 4 + 2 + 5 + 3 + 7 + 11 + 10 + 15 = 58
 */

/**
 执行用时：28 ms, 在所有 Swift 提交中击败了40.54%的用户
 内存消耗：13.5 MB, 在所有 Swift 提交中击败了35.14%的用户
 */
class SumOddLengthSubarrays {
    func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
        var sum = 0
        let len = arr.count
        
        // 子数组所有可能长度：1，3，5...
        for subArrLen in 1...len {
            if subArrLen % 2 != 0 {
                // 遍历某种长度的子数组，如 subArrLen= 3
                for i in 0...len - subArrLen {
                    // 滑动窗口，数组求和
                    var subSum = 0
                    for j in i..<i + subArrLen {
                        subSum += arr[j]
                    }
                    
                    sum += subSum
                }
            }
        }
        
        return sum
    }
}
