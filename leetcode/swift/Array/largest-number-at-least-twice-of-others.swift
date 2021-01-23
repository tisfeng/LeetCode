//
//  largest-number-at-least-twice-of-others.swift
//  leetcode
//
//  Created by tisfeng on 2020/12/19.
//

import Foundation

/**
 747. 至少是其他数字两倍的最大数 https://leetcode-cn.com/problems/largest-number-at-least-twice-of-others/
 
 在一个给定的数组nums中，总是存在一个最大元素 。
 查找数组中的最大元素是否至少是数组中每个其他数字的两倍。
 如果是，则返回最大元素的索引，否则返回-1。
 
 输入: nums = [3, 6, 1, 0]
 输出: 1
 */

/**
 执行用时：12 ms, 在所有 Swift 提交中击败了70.00%的用户
 内存消耗：13.7 MB, 在所有 Swift 提交中击败了11.11%的用户
 */
class DominantIndex {
    func dominantIndex(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return 0
        }
        
        var maxIndex = 0
        var secondMaxIndex = 0
        for i in 1..<nums.count {
            if nums[i] > nums[maxIndex] {
                secondMaxIndex = maxIndex
                maxIndex = i
            } else {
                if ((nums[i] > nums[secondMaxIndex]) || (nums[i] < nums[secondMaxIndex] && i == 1)) {
                    secondMaxIndex = i
                }
            }
        }
        
        if (nums[secondMaxIndex] == 0) || (nums[maxIndex] / nums[secondMaxIndex] >= 2) {
            return maxIndex
        }
        return -1
    }
}
