//
//  diagonal-traverse-ii.swift
//  leetcode
//
//  Created by tisfeng on 2020/12/13.
//

import Foundation

/**
 1424. 对角线遍历 II https://leetcode-cn.com/problems/diagonal-traverse-ii/
 
 输入：nums = [
 [1,2,3,4,5],
 [6,7],
 [8],
 [9,10,11],
 [12,13,14,15,16]]
 
 输出：[1,6,2,8,7,3,9,4,12,10,5,13,11,14,15,16]
 
 [
 [11,6,9,20],
 [16,1,20],
 [14,19,14,17,15],
 [8,19,11,3],
 [3,13,17,4]]
 
 
 [[14,12,19,16,9],[13,14,15,8,11],[11,13,1]]
 [
 [14,12,19,16,9],
 [13,14,15,8,11],
 [11,13,1]]

 超时
 */
class FindDiagonalOrder_0 {
    func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
        var arr = [Int]()
        let firstRowCount = nums.count
        let lastColumCount = nums[firstRowCount-1].count
        
        var maxRow = 0
        var maxDiagonalCount = 0
        // 打印左上区域
        for index in 0..<firstRowCount-1 {
            let diagonalCount = nums[index].count - (firstRowCount - index - 1)
            if diagonalCount >= maxDiagonalCount {
                maxDiagonalCount = diagonalCount
            }
            
            if nums[index].count > maxRow {
                maxRow = nums[index].count
            }
            
            var i = index
            var j = 0
            while j <= index {
                if j < nums[i].count {
                    let a = nums[i][j]
                    arr.append(a)
                }
                j += 1
                i -= 1
            }
        }

        maxDiagonalCount = max(maxDiagonalCount, lastColumCount)
        maxRow = max(maxRow, lastColumCount)
        //        print("diagonalCount=\(maxDiagonalCount), maxRow=\(maxRow)")

        // 打印右下区域 [2][0],[1][1],[0][2],  [2][1],[1][2]  [2,2]
        for index in 0..<maxDiagonalCount { // 2,1,0
            var i = firstRowCount - 1
            var j = index
            while i >= 0 && j < maxRow {
                if j < nums[i].count {
                    let a = nums[i][j]
                    arr.append(a)
                }
                j += 1
                i -= 1
            }
        }
        
        return arr
    }
}

/**
 执行用时：1440 ms, 在所有 Swift 提交中击败了50.00%的用户
 内存消耗：24.9 MB, 在所有 Swift 提交中击败了100.00%的用户
 */
class Solution {
    typealias NumberInfo = (r:Int,c:Int,val:Int)
    func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
        guard nums.count > 1 else {
            return nums[0]
        }
        var numbers = [NumberInfo]()
        for r in 0..<nums.count {
            for c in 0..<nums[r].count {
                numbers.append((r,c,nums[r][c]))
            }
        }
        let sortedNumbers = numbers.sorted { (arg0, arg1) -> Bool in
            
            let (r, c, _) = arg0
            let (r1, c1, _) = arg1
            
            if r + c == r1 + c1 {
                return r > r1
            }
            return r + c < r1 + c1
        }
        
        return sortedNumbers.map {$0.val}
    }
}
