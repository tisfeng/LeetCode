//
//  rank-transform-of-an-array.swift
//  leetcode
//
//  Created by tisfeng on 2020/11/29.
//

import Foundation

/**
 1331. 数组序号转换   https://leetcode-cn.com/problems/rank-transform-of-an-array/
 
 输入：arr = [40,10,20,30] -->[10,20,30,40]
 输出：[4,1,2,3]
 解释：40 是最大的元素。 10 是最小的元素。 20 是第二小的数字。 30 是第三小的数字。

 */

class Solution {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        let len = arr.count
        var indexArr = [Int](repeating: 0, count: len)
        
//        print("arr: \(arr)")
//        print("sorted: \(arr.sorted())")

        let uniqueSortedArr = arr.sorted().unique
        for i in 0..<len {
            let index = uniqueSortedArr.firstIndex(of: arr[i])!
            indexArr[i] = index + 1
        }
        
        return indexArr
    }
}

/// 数组去重，保持有序
extension Array where Element:Hashable {
    var unique:[Element] {
        var uniq = Set<Element>()
        uniq.reserveCapacity(self.count)
        return self.filter {
            return uniq.insert($0).inserted
        }
    }
}
