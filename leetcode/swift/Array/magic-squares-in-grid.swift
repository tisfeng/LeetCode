//
//  magic-squares-in-grid.swift
//  leetcode
//
//  Created by isfeng on 2020/9/10.
//

import Foundation

class Solution {
    func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
        var count = 0
        let i_len = grid.count
        let j_len = grid[0].count
        
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
                
                let equal =
                    row1 == row2 &&
                    row1 == row3 &&
                    row1 == column1 &&
                    row1 == column2 &&
                    row1 == column3 &&
                    row1 == slash1 &&
                    row1 == slash2
                
                if equal {
                    count += 1
                }
            }
        }
        
        return count
    }
}
