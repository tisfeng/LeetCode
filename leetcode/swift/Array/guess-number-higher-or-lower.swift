//
//  guess-number-higher-or-lower.swift
//  leetcode
//
//  Created by isfeng on 2020/9/13.
//

import Foundation

/**
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return          -1 if the picked number is lower than your guess number
 *                  1 if the picked number is higher than your guess number
 *               otherwise return 0
 * func guess(_ num: Int) -> Int
 */

class GuessGame {
    var target = 1
    
    func guess(_ num: Int) -> Int {
        if num == target {
            return 0
        } else if num > target {
            return 1
        } else {
            return -1
        }
    }
}

/**
执行用时：4 ms, 在所有 Swift 提交中击败了72.73%的用户
内存消耗：13.6 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class Solution : GuessGame {
    func guessNumber(_ n: Int) -> Int {  // [1,2,3,4,5,6,7,8,9]
        var start = 0
        var end = n
        var mid = (start + end) / 2
    
        while guess(mid) != 0 {
            if end - start == 1 {
                if guess(end) == 0 {
                    return end
                } else {
                    return start
                }
            }
            if guess(mid) > 0 {
                start = mid
            } else {
                end = mid
            }
            mid = (start + end) / 2
        }
        return mid
    }
}
