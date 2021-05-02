//
//  kth-missing-positive-number.swift
//  leetcode
//
//  Created by tisfeng on 2021/1/23.
//

import Foundation

/**
 1539. 第 k 个缺失的正整数 https://leetcode-cn.com/problems/kth-missing-positive-number/
 
 输入：arr = [2,3,4,7,11], k = 5
 输出：9
 解释：缺失的正整数包括 [1,5,6,8,9,10,12,13,...] 。第 5 个缺失的正整数为 9 。
 */

/**
 执行用时：28 ms, 在所有 Swift 提交中击败了100.00%的用户
 内存消耗：13.5 MB, 在所有 Swift 提交中击败了60.00%的用户
 */
class FindKthPositive {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var index = 0 // 缺失数哨兵
        var i = 0
        var num = 1 // 完整的正整数序列从1开始
        let max = arr.last!
        while index < k {
            while i < arr.count {
                if arr[i] != num {
                    index += 1
                    // arr未遍历完，但k已找到
                    if index == k {
                        print("break")
                        break
                    }
                } else {
                    i += 1
                }
                num += 1
                // arr 已遍历完
                if num > max {
                    return max + k - index
                }
            }
        }
        return num
    }
}


/**
 执行用时：1640 ms, 在所有 Swift 提交中击败了13.33%的用户
 内存消耗：13.9 MB, 在所有 Swift 提交中击败了6.67%的用户
 */
class FindKthPositive_13 {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var targetArr = [Int]() // 1,2,3,4,5,6,7,8,9
        for i in 0..<arr.last!+k {
            targetArr.append(i + 1)
        }
        let arr = targetArr.filter {
            !arr.contains($0)
        }
        return arr[k-1]
    }
    
}
