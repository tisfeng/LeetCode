//
//  find-k-closest-elements.swift
//  leetcode
//
//  Created by isfeng on 2020/9/17.
//

import Foundation

/**
 执行用时：428 ms, 在所有 Swift 提交中击败了100.00%的用户
 内存消耗：14.4 MB, 在所有 Swift 提交中击败了100.00%的用户
 */
class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var array = [Int]() // 记录最接近元素的index
        var count = 0
        let len = arr.count
        var index = searchNumLastIndex(x, inArray: arr)
        
        var left = index
        var right = index
        if index >= 0 {
            array.append(index)
            count += 1
            left -= 1
            right += 1
        } else { //不存在 x元素
            index = -index
            left = index
            right = index + 1
        }
        
        while count < k { // [0,1,1,1,2,3,6,7,8,9]
            //  print("left=\(left), right=\(right), array=\(array)")
            if left < 0 {
                array.append(right)
                right += 1
                count += 1
                continue
            }
            if right >= len {
                array.insert(left, at: 0)
                left -= 1
                count += 1
                continue
            }
            
            if x - arr[left] <= arr[right] - x {
                array.insert(left, at: 0)
                left -= 1
            } else {
                array.append(right)
                right += 1
            }
            count += 1
        }
            
        return array.map { index in
            arr[index]
        }
    }
    
    func searchNumLastIndex(_ num: Int, inArray sortedArr: [Int]) -> Int {
        let minIndex = searchNumFirstIndex(num, inArray: sortedArr)
        if minIndex < 0 {
            return minIndex
        }
        
        var maxIndex = minIndex
        for index in (minIndex..<sortedArr.count) {
            if sortedArr[index] == num {
                maxIndex = index
            } else {
                break
            }
        }
        return maxIndex
    }
    
    /*
     二分查找num在已排好序数组中的index；
     若数组中存在多个num，则返回最小的index；
     若数不存在num，则返回最接近<num元素的-index；
     */
    func searchNumFirstIndex(_ num: Int, inArray sortedArr:[Int]) -> Int {
        var start = 0
        var end = sortedArr.count - 1
        var middle = (start + end) / 2
        
        if num < sortedArr[start] {
            return 0
        }
        if num > sortedArr[end] {
            return end
        }
        
        while sortedArr[middle] != num {
            middle = (start + end) / 2
            if end - start == 1 {
                if num == sortedArr[start] {
                    return start
                } else if num == sortedArr[end] {
                    return end
                } else {
                    return -start
                }
            }
            if sortedArr[middle] > num {
                end = middle
            } else {
                start = middle
            }
        }
        
        for i in (0 ..< middle).reversed() {
            if sortedArr[i] == num {
                middle = i
            } else {
                break
            }
        }
        
        return middle
    }
}
