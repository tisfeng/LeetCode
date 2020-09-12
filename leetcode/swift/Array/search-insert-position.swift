//
//  search-insert-position.swift
//  leetcode
//
//  Created by isfeng on 2020/9/12.
//

import Foundation

/**
 执行用时：32 ms, 在所有 Swift 提交中击败了100.00%的用户
 内存消耗：13.1 MB, 在所有 Swift 提交中击败了100.00%的用户
 
 untime: 44 ms, faster than 34.93% of Swift online submissions for Search Insert Position.
 Memory Usage: 20.6 MB, less than 93.49% of Swift online submissions for Search Insert Position.
*/
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1
        var middle = (start + end) / 2
        
        if target < nums[start] {
            return 0
        }
        if target > nums[end] {
            return end + 1
        }

        while nums[middle] != target {  // [1,3]  2
            middle = (start + end) / 2
            if end - start == 1 {
                if target == nums[start] {
                    return start
                } else {
                    return end
                }
            }
            if nums[middle] > target {
                end = middle
            } else {
                start = middle
            }
        }
        return middle
    }
    
    /*
     二分查找num在已排好序数组中的index；
     若数组中存在多个num，则返回最小的index；
     若数不存在num，则返回最接近<num元素的-index；
     若num不在数组的范围，返回最小负数 Int.min
     */
    func searchNum(_ num: Int, inArray sortedArr:[Int]) -> Int {
        var start = 0
        var end = sortedArr.count - 1
        var middle = (start + end) / 2
        
        if num > sortedArr.last! || num < sortedArr.first! {
            return Int.min
        }
        while sortedArr[middle] != num {
            middle = (start + end) / 2
            if end - start == 1 {
                if num == sortedArr[start] {
                    return start
                } else if num == sortedArr[end] {
                    return end
                } else {
                    return -start
                }
            }
            if sortedArr[middle] > num {
                end = middle
            } else {
                start = middle
            }
        }
        
        for i in (0 ..< middle).reversed() {
            if sortedArr[i] == num {
                middle = i
            } else {
                break
            }
        }
        
        return middle
    }
}
