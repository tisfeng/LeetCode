//
//  magic-squares-in-grid.swift
//  leetcode
//
//  Created by isfeng on 2020/9/10.
//

import Foundation

/**
 执行用时：8 ms, 在所有 Swift 提交中击败了100.00%的用户
 内存消耗：13.7 MB, 在所有 Swift 提交中击败了100.00%的用户
 */
class Solution {
    func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
        var count = 0
        let len = 3
        let i_len = grid.count, j_len = grid[0].count
        if i_len < len || j_len < len {
            return 0
        }
        for i in 0 ... i_len - len {
            for j in 0 ... j_len - len {
                var row_sum = 0, column_sum = 0, slash_sum1 = 0, slash_sum2 = 0
                let targetSet: Set = [1,2,3,4,5,6,7,8,9]
                var currentSet = Set<Int>()
                var equal = false
                
                for k in 0 ..< len {
                    slash_sum1 += grid[i+k][j+k]
                    slash_sum2 += grid[i+len-k-1][j+k]
                }
                if slash_sum1 != slash_sum2 {
                    continue
                }
                
                for row in 0 ..< len {
                    var new_row_sum = 0, new_column_sum = 0
                    for column in 0 ..< len {
                        let num = grid[i+row][j+column]
                        if num < 1 || num > 9 {
                            continue
                        }
                        currentSet.insert(num)
                        
                        new_row_sum += grid[i+row][j+column]
                        new_column_sum += grid[i+column][j+row]
                    }
                    
                    if row == 0 {
                        row_sum = new_row_sum
                        column_sum = new_column_sum
                    }
                    
                    if row_sum == new_row_sum  &&
                        column_sum == new_column_sum &&
                        row_sum == column_sum {
                        equal = true
                    } else {
                        equal = false
                        break
                    }
                }
                
                if equal && currentSet == targetSet {
                    count += 1
                }
            }
        }
        
        return count
    }
}

/**
 执行用时：12 ms, 在所有 Swift 提交中击败了100.00%的用户
 内存消耗：13.4 MB, 在所有 Swift 提交中击败了100.00%的用户
 */
class Solution_100 {
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
