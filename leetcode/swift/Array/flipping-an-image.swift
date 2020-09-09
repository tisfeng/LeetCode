//
//  flipping-an-image.swift
//  leetcode
//
//  Created by isfeng on 2020/9/8.
//

// https://leetcode-cn.com/problems/flipping-an-image/

import Foundation

/**
 执行用时：32 ms, 在所有 Swift 提交中击败了100.00%的用户
 内存消耗：13.4 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class FlipAndInvertImage {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        var newA = [[Int]]()
        for i in 0 ..< A.count {
            var arr = A[i]
            flip(&arr)
            invert(&arr)
            newA.append(arr)
        }
        return newA
    }
    
    func flip(_ array: inout [Int]) {
        let len = array.count
        for i in 0 ..< len / 2 {
            array.swapAt(i, len - i - 1)
        }
    }
    
    func invert(_ array: inout [Int]) {
        for i in 0 ..< array.count {
            array[i] == 0 ? (array[i] = 1) : (array[i] = 0)
        }
    }
}

/**
 执行用时：32 ms, 在所有 Swift 提交中击败了100.00%的用户
 内存消耗：13.4 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class FlipAndInvertImage_100 {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        var newA = [[Int]]()
        for i in 0 ..< A.count {
            var arr = A[i]
            flipInvert(&arr)
            newA.append(arr)
        }
        return newA
    }
    
    func flipInvert(_ array: inout [Int]) { // [1,0,0,1,0]
        let len = array.count
        for i in 0 ..< len / 2 {
            array.swapAt(i, len - i - 1)
            array[i] == 0 ? (array[i] = 1) : (array[i] = 0)
        }
        for i in len / 2 ..< len {
            array[i] == 0 ? (array[i] = 1) : (array[i] = 0)
        }
    }
}
