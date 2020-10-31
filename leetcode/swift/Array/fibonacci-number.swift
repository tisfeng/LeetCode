//
//  fibonacci-number.swift
//  leetcode
//
//  Created by tisfeng on 2020/10/31.
//

import Foundation

// https://leetcode-cn.com/problems/fibonacci-number/submissions/

/**
 1,1,2,3,5,8
 执行用时：0 ms, 在所有 Swift 提交中击败了100.00%的用户
 内存消耗：13.4 MB, 在所有 Swift 提交中击败了57.69%的用户
*/
class Fib {
    func fib(_ N: Int) -> Int {
        if N == 0 {
            return 0
        }
        var p = 0, q = 1, r = 0
        for _ in 1...N {
            p = q
            q = r
            r = p + q
            print("r = \(r)")
        }
        return r
    }
}
