//
//  transpose-matrix.swift
//  leetcode
//
//  Created by tisfeng on 2020/11/22.
//

import Foundation

/**
 867. 转置矩阵
 https://leetcode-cn.com/problems/transpose-matrix/
 
 给定一个矩阵 A， 返回 A 的转置矩阵。

 矩阵的转置是指将矩阵的主对角线翻转，交换矩阵的行索引与列索引。
 
 输入：
 [[1,2,3],
 [4,5,6],
 [7,8,9]]
 
 输出：
 [[1,4,7],
 [2,5,8],
 [3,6,9]]
 
 
 [[1,2,3],
 [4,5,6]]
 
 [[1,4],
 [2,5],
 [3,6]]
 */


class Solution {
    func transpose(_ A: [[Int]]) -> [[Int]] {
        let row = A.count
        let column = A[0].count
        
        var a = [[Int]](repeating: [Int](repeating: 0, count: row), count: column)
        
        for i in 0..<row {
            for j in 0..<column {
                a[j][i] = A[i][j]
                
                print("\(a[j][i])")
            }
        }
        
        
        return a
    }
}
