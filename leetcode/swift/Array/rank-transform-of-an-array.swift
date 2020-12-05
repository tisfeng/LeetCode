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
 
 
 [40,10,10,20,30,30]
 [4,1,1,2,3,3]
 */

/**
 执行用时：720 ms, 在所有 Swift 提交中击败了100.00%的用户
 内存消耗：24.1 MB, 在所有 Swift 提交中击败了33.33%的用户
 */
class ArrayRankTransform {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        //初始化一个字典用来存储排序后原数组的元素和序号
        var map = [Int: Int]()
        var result = [Int]()
        
        //将去重且排序后的数组元素和其对应的序号插入字典
        for (index, num) in Set(arr).sorted(by: <).enumerated() {
//            map.updateValue(index + 1, forKey: num)
            map[num] = index + 1
        }
        
//        print("arr: \(arr)")
//        print("map: \(map)")
        
        //将每个元素的序号按原数组的顺序添加到返回值
        for num in arr {
            result.append(map[num]!)
        }
        
        return result
    }
}

class Solution_0 {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        let len = arr.count
        var indexArr = [Int](repeating: 0, count: len)
        
//        print("arr: \(arr)")
//        print("sorted: \(arr.sorted())")

        let uniqueSortedArr = Array(Set(arr)).sorted()  //arr.unique.sorted()
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
