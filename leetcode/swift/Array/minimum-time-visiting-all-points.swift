//
//  minimum-time-visiting-all-points.swift
//  leetcode
//
//  Created by tisfeng on 2020/12/19.
//

import Foundation

/**
 1266. 访问所有点的最小时间 https://leetcode-cn.com/problems/minimum-time-visiting-all-points/
 */

/**
 执行用时：44 ms, 在所有 Swift 提交中击败了87.50%的用户
 内存消耗：13.8 MB, 在所有 Swift 提交中击败了6.67%的用户
 */
class Solution {
    func minTimeToVisitAllPoints(_ points: [[Int]]) -> Int {
        var minTime = 0
        for i in 0..<points.count-1 {
            minTime += minTimeToVisitTwoPoints(points[i], points[i+1])
        }
        return minTime
    }
    
    /// 计算访问两点的最小时间
    func minTimeToVisitTwoPoints(_ point: [Int], _ point2: [Int]) -> Int {
        let distanceX = abs(point[0] - point2[0])
        let distanceY = abs(point[1] - point2[1])
        return max(distanceX, distanceY)
    }
}
