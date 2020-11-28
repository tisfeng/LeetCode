//
//  summary-ranges.swift
//  leetcode
//
//  Created by tisfeng on 2020/11/28.
//

import Foundation

/**
 228. 汇总区间  https://leetcode-cn.com/problems/summary-ranges/
 
 输入：nums = [0,1,2,4,5,7]
 输出：["0->2","4->5","7"]
 */

/**
 执行用时：4 ms, 在所有 Swift 提交中击败了100.00%的用户
 内存消耗：13.4 MB, 在所有 Swift 提交中击败了100.00%的用户
 */
class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        let len = nums.count
        var arr = [String]()
        var index = 0
        
        while index < len {
            let start = index
            while index < len - 1 && nums[index] + 1 == nums[index + 1] {
                index += 1
            }
            
            if index == start {
                arr.append("\(nums[start])")
            } else {
                arr.append("\(nums[start])" + "->" + "\(nums[index])")
            }
            index += 1
        }
        
        return arr
    }
}
