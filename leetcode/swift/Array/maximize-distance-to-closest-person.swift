//
//  maximize-distance-to-closest-person.swift
//  leetcode
//
//  Created by tisfeng on 2020/11/28.
//

import Foundation


/**
 849. 到最近的人的最大距离    https://leetcode-cn.com/problems/maximize-distance-to-closest-person/
 
 输入：seats = [1,0,0,0,1,0,1]
 输出：2
 */

/**
 执行用时：96 ms, 在所有 Swift 提交中击败了100.00%的用户
 内存消耗：14.2 MB, 在所有 Swift 提交中击败了100.00%的用户
 */
class Solution {
    func maxDistToClosest(_ seats: [Int]) -> Int {
        let len = seats.count
        var count = 0
        // 末尾优化 [0,1,0,0]
        for num in seats.reversed() {
            if num == 0 {
                count += 1
            } else {
                if count >= len / 2 {
//                    print("last optimize")
                    return count
                }
                break;
            }
        }
        
        // 记录连续0的位置，arr[1]=3 表示seats[1]位置起有3个连续0
        // arr[0]记录起始边界，arr[1]记录中间位置，arr[2]记录末尾边界
        var arr = [Int](repeating: 0, count: 3)
        
        var index = 0
        while index < len {
            let start = index
            var count = 0
            while index < len && seats[index] == 0 {
                index += 1
                count += 1
            }
            
            // 起点优化 [0,0,1,0,0]
            if start == 0 && count >= len / 2 {
//                print("first optimize")
                return count
            }
            
            if count > 0 {
                if start == 0 { // [0,0,1,0,0,1]
                    arr[0] = count
                } else if start + count == len {
                    arr[2] = count
                } else {
                    if count > arr[1] {
                        arr[1] = count
                    }
                }
            }
            
            index += 1
        }
        
        let midMax = (arr[1] + 1) / 2
        let boundMax = max(arr[0], arr[2])
//        print("arr: \(arr), mid: \(boundMax)")
        
        return max(midMax, boundMax)
    }
}
