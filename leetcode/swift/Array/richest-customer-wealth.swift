//
//  richest-customer-wealth.swift
//  leetcode
//
//  Created by tisfeng on 2020/12/5.
//

import Foundation

/**
 1672. 最富有客户的资产总量   https://leetcode-cn.com/problems/richest-customer-wealth/
 */


/**
 执行用时：40 ms, 在所有 Swift 提交中击败了100.00%的用户
 内存消耗：13.7 MB, 在所有 Swift 提交中击败了27.27%的用户
 */
class Solution {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        let len = accounts.count
        var sumArray = [Int](repeating: 0, count: len)
        for i in 0..<len {
            var sum = 0
            for j in 0..<accounts[i].count {
                sum += accounts[i][j]
            }
            sumArray[i] = sum
        }
        
        return sumArray.max()!
    }
}
