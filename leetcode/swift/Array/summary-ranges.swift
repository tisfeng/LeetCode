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
 内存消耗：13.7 MB, 在所有 Swift 提交中击败了50.00%的用户
 */
class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        let len = nums.count
        if len == 0 {
            return []
        }
        if len == 1 {
            return ["\(nums[0])"]
        }
        
        var arr = [String]()
        var index = 0
        
        repeat {
            print("index: \(index)")
            let start = index
            while index < len - 1 && nums[index] + 1 == nums[index + 1] {
                index += 1
            }
            print("index: \(index)")
            
            if index == start {
                arr.append("\(nums[start])")
            } else {
                arr.append("\(nums[start])" + "->" + "\(nums[index])")
            }
            index += 1
            print("arr: \(arr), index: \(index)")
            
        } while index < len
        
        return arr
    }
}
