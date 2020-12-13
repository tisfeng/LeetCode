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

 */
class Solution {
    func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
        var arr = [Int]()
        let firstRowCount = nums.count
        let firstColumnCount = nums[0].count
        let lastColumCount = nums[firstRowCount-1].count
        
        var maxRow = 0
        var maxRowIndex = 0
        // 打印左上区域
        for index in 0..<firstRowCount-1 {
            if nums[index].count >= maxRow {
                maxRow = nums[index].count
                maxRowIndex = index
            }
            
            var i = index
            var j = 0
            while j <= index {
                if j < nums[i].count {
                    let a = nums[i][j]
//                    print("num[\(i)][\(j)]=\(a)")
                    arr.append(a)
                }
                j += 1
                i -= 1
            }
        }
//        print("\narr: \(arr)")

        print("\(maxRow), \(lastColumCount) firstColumnCount: \(firstColumnCount)")
        
        var diagonalCount = lastColumCount
        
//        if firstRowCount + lastColumCount < maxRow {
//            diagonalCount = maxRow - firstRowCount
//        }
        
        if maxRow - maxRowIndex > lastColumCount {
            diagonalCount = maxRow - maxRowIndex
        }
        
        maxRow = max(maxRow, lastColumCount)
        print("diagonalCount=\(diagonalCount), maxRow=\(maxRow)")
        
        // 打印右下区域 [2][0],[1][1],[0][2],  [2][1],[1][2]  [2,2]
        for index in 0..<diagonalCount { // 2,1,0
            var i = firstRowCount - 1
            var j = index
            
            print("i=\(i), j=\(j), count=\(nums[i].count)")
            while i >= 0 && j < maxRow {
                if j < nums[i].count {
                    let a = nums[i][j]
                    print("push: num=\(a)")
                    arr.append(a)
                }
                j += 1
                i -= 1
                print("--> i=\(i), j=\(j)") // count=\(nums[i].count)
            }
        }
   
        /**
         [
         [14,12,19,16,9],
         [13,14,15,8,11],
         [11,13,1]]
         */
        
//        print("\narr: \(arr)")
        
        return arr
    }
}
