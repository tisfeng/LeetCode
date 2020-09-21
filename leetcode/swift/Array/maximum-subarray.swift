//
//  maximum-subarray.swift
//  leetcode
//
//  Created by isfeng on 2020/9/20.
//

import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int { //[-2,1,-3,4,-1,2,1,-5,4]
        let len = nums.count
        var maxSum = Int.min
        var currentSum = nums[0]
        var preSum = nums[0]
       
        for i in 0 ..< len {
            print("i=\(i), maxSum=\(maxSum), currentSum=\(currentSum)")
            
            preSum = currentSum
            
            currentSum += nums[i]
            
            if preSum < 0 {
                currentSum = nums[i]
                
                if nums[i] > maxSum {
                    maxSum = nums[i]
                }
                continue
            }
            
            let newMaxSum = currentSum + nums[i]
            if newMaxSum > maxSum {
                maxSum = newMaxSum
            }
        }
        
        return maxSum
    }
}
