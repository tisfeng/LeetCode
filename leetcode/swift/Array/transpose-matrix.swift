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


/**
 执行用时：116 ms, 在所有 Swift 提交中击败了100.00%的用户
 内存消耗：13.8 MB, 在所有 Swift 提交中击败了59.46%的用户
 */
class Transpose {
    func transpose(_ A: [[Int]]) -> [[Int]] {
        let row = A.count
        let column = A[0].count
        
        var a = [[Int]](repeating: [Int](repeating: 0, count: row), count: column)
        
        for i in 0..<row {
            for j in 0..<column {
                a[j][i] = A[i][j]
            }
        }
        
        return a
    }
}
