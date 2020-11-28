//
//  triangle.swift
//  leetcode
//
//  Created by tisfeng on 2020/11/28.
//

import Foundation


/**
 120. 三角形最小路径和  https://leetcode-cn.com/problems/triangle/
 
 例如，给定三角形：

 [
      [2],
     [3,4],
    [6,5,7],
   [4,1,8,3]
 ]
 自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
 
 
 [
       [-1],
      [2, 3],
     [1,-1,-3]
 ]

 动态规划：-1，3，3 = -1
 
 */
class MinimumTotal {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var sum = 0
        var minIdx = 0
        let len = triangle.count
        for i in 0..<len {
            let arr = triangle[i]
            var minNum: Int
            if i == 0 {
               minNum = arr[0]
            } else {
                minNum = min(arr[minIdx], arr[minIdx + 1])
            }
            
            sum += minNum
            minIdx = arr.firstIndex(of: minNum)!
        }
        
        return sum
    }
}
