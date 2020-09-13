//
//  first-bad-version.swift
//  leetcode
//
//  Created by isfeng on 2020/9/13.
//

import Foundation

/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class VersionControl {
    func isBadVersion(_ version: Int) -> Bool {
        return true
    }
}

/**
执行用时：24 ms, 在所有 Swift 提交中击败了98.51%的用户
内存消耗：13.1 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int { //[1,2,3,4,5,6,7,8,9]
        var start = 0
        var end = n
        var mid: Int
        var firstBad = start
        
        if isBadVersion(start) {
            return firstBad
        }
        while end - start > 1 {
            mid = (start + end) / 2
            if isBadVersion(mid) {
                end = mid
            } else {
                start = mid
            }
        }
        firstBad = end
        
        return firstBad
    }
}
