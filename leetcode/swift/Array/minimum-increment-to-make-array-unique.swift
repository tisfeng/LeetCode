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
 
 改：
 思路：先从大的元素，开始递增，减少碰撞
 */
class Solution {
    func minIncrementForUnique(_ A: [Int]) -> Int {
//        print("\(A)")
//        let A = A.sorted()
//        print("\(A)")
        
        let len = A.count
        var map = [Int: Int]()
        var increment = 0
        for i in 0..<len {
            let value = A[i]
            if map[A[i]] == nil {
                map[value] = i
//                print("push \(value)")
            } else {
                var new = value
                repeat {
                    new += 1
                } while map[new] != nil
                
                map[new] = i
                increment += new - value
//                print("increase \(new - value), push \(new)")
            }
        }
//        print("map: \(map)")
        
        return increment
    }
}
