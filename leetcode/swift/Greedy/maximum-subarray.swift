//
//  maximum-subarray.swift
//  leetcode
//
//  Created by isfeng on 2020/9/20.
//

import Foundation

/**
 53. 最大子序和
 https://leetcode-cn.com/problems/maximum-subarray/
 
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 */


/**
 贪心法：若当前指针所指元素【之前的和】小于0，则丢弃当前元素【之前的序列】
 
 执行用时：40 ms, 在所有 Swift 提交中击败了98.67%的用户
 内存消耗：13.2 MB, 在所有 Swift 提交中击败了97.38%的用户
 */
class MaxSubArray {
    func maxSubArray(_ nums: [Int]) -> Int { //[-2,1,-3,4,-1,2,1,-5,4]
        var maxSum = Int.min
        var currentSum = maxSum
        var preSum: Int
       
        for i in 0 ..< nums.count {
            preSum = currentSum
            if preSum < 0 {
                currentSum = nums[i]
                if nums[i] > maxSum {
                    maxSum = nums[i]
                }
            } else {
                currentSum += nums[i] // 贪心，累加
                if currentSum > maxSum {
                    maxSum = currentSum
                }
            }
//            print("i=\(i), preSum=\(preSum), currentSum=\(currentSum),  maxSum=\(maxSum)")
        }
        return maxSum
    }
}
