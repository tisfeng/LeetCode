//
//  minimum-increment-to-make-array-unique.swift
//  leetcode
//
//  Created by tisfeng on 2020/12/5.
//

import Foundation

/**
 945. 使数组唯一的最小增量    https://leetcode-cn.com/problems/minimum-increment-to-make-array-unique/
 
 输入：[1,2,2]
 输出：1
 
 输入：[3,2,1,2,1,7]
 输出：6
 */

/**
 超时
 */
class Solution {
    func minIncrementForUnique(_ A: [Int]) -> Int {
        let len = A.count
        var map = [Int: Int]()
        var increment = 0
        for i in 0..<len {
            var value = A[i]
            if map[A[i]] == nil {
                map[value] = i
//                print("push \(value)")
            } else {
                var k = 0
                repeat {
                    value += 1
                    k += 1
                } while map[value] != nil
                
                map[value] = i
                increment += k
//                print("increase \(k), push \(value)")
            }
        }
        
        return increment
    }
}
