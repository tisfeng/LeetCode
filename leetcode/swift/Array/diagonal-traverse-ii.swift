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
class Solution {
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
//                    print("num[\(i)][\(j)]=\(a)")
                    arr.append(a)
                }
                j += 1
                i -= 1
            }
        }
//        print("\narr: \(arr)")

        maxDiagonalCount = max(maxDiagonalCount, lastColumCount)
        maxRow = max(maxRow, lastColumCount)
        //        print("diagonalCount=\(maxDiagonalCount), maxRow=\(maxRow)")

        
        // 打印右下区域 [2][0],[1][1],[0][2],  [2][1],[1][2]  [2,2]
        for index in 0..<maxDiagonalCount { // 2,1,0
            var i = firstRowCount - 1
            var j = index
            
//            print("i=\(i), j=\(j), count=\(nums[i].count)")
            while i >= 0 && j < maxRow {
                if j < nums[i].count {
                    let a = nums[i][j]
//                    print("push: num=\(a)")
                    arr.append(a)
                }
                j += 1
                i -= 1
//                print("--> i=\(i), j=\(j)") // count=\(nums[i].count)
            }
        }
   
        /**
         [
         [35,20,24,2,14,16,20],
         [27,25,2,36,23,31,10,1],
         [31,23,8,26,27,16],
         [26,30,35,17,13,12,12,14,34,20],
         [30,20,36,27,1,2,27],
         [32,24,2,29,3],
         [39,14,28,8,8,9,29,30,20],
         [30,13,39,16,8,21,2,5,3],
         [7,14,28,18,3]]
         */
        
//        print("\narr: \(arr)")
        
        return arr
    }
}
