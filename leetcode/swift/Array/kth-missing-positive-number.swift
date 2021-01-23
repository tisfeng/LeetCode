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
 执行用时：1640 ms, 在所有 Swift 提交中击败了13.33%的用户
 内存消耗：13.9 MB, 在所有 Swift 提交中击败了6.67%的用户
 */
class Solution {
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

class Solution_ {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var index = 0 // 缺失数序列index
        var i = 0 // arr 哨兵
        var targetNum = 1
        while index < k {
            for num in arr {
                if num == i {
                    i += 1
                } else {
                    index += 1
                }
            }
            
            while i < arr.count {
                if arr[i] == targetNum {
                    i += 1
                } else {
                    index += 1
                }
                print("i=\(i), index=\(index)")
            }
            
            print(index)
        }
        
        return 0
    }
}
