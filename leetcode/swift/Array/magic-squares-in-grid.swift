//
//  magic-squares-in-grid.swift
//  leetcode
//
//  Created by isfeng on 2020/9/10.
//

import Foundation
/**
[[4,3,8,4,6,8],
 [9,5,1,9,2,5],
 [2,7,6,2,7,4],
 [3,5,1,2,8,7],
 [1,7,5,2,9,4]]
*/
/**
 执行用时：12 ms, 在所有 Swift 提交中击败了100.00%的用户
 内存消耗：13.4 MB, 在所有 Swift 提交中击败了100.00%的用户
 */
class Solution {
    func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
        var count = 0
        let i_len = grid.count
        let j_len = grid[0].count
        if i_len < 3 || j_len < 3 {
            return 0
        }
        for i in 0 ..< i_len - 2 {
            for j in 0 ..< j_len - 2 {
                let row1 = grid[i][j] + grid[i][j+1] + grid[i][j+2]
                let row2 = grid[i+1][j] + grid[i+1][j+1] + grid[i+1][j+2]
                let row3 = grid[i+2][j] + grid[i+2][j+1] + grid[i+2][j+2]
                
                let column1 = grid[i][j] + grid[i+1][j] + grid[i+2][j]
                let column2 = grid[i][j+1] + grid[i+1][j+1] + grid[i+2][j+1]
                let column3 = grid[i][j+2] + grid[i+1][j+2] + grid[i+2][j+2]
                
                let slash1 = grid[i][j] + grid[i+1][j+1] + grid[i+2][j+2]
                let slash2 = grid[i+2][j] + grid[i+1][j+1] + grid[i][j+2]
                
                let currentSet: Set = [grid[i][j], grid[i][j+1],grid[i][j+2],
                                grid[i+1][j], grid[i+1][j+1],grid[i+1][j+2],
                                grid[i+2][j], grid[i+2][j+1], grid[i+2][j+2]]
                let targetSet: Set = [1,2,3,4,5,6,7,8,9]
                
                let equal =
                    row1 == row2 &&
                    row1 == row3 &&
                    row1 == column1 &&
                    row1 == column2 &&
                    row1 == column3 &&
                    row1 == slash1 &&
                    row1 == slash2
                
                if equal && currentSet == targetSet {
                    count += 1
                }
            }
        }
        
        return count
    }
}
