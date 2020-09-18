//
//  find-k-closest-elements.swift
//  leetcode
//
//  Created by isfeng on 2020/9/17.
//

import Foundation

class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var array = [Int]() // 记录最接近元素的index
        var count = 0
        let len = arr.count
        
        var index = searchNumLastIndex(x, inArray: arr)
        
        var left = index
        var right = index
        
        
        print("most close index: \(index)")
        
        if index >= 0 {
            array.append(index)
            count += 1
            if left > 0 {
                left -= 1
            }
            if right < len {
                right += 1
            }
        } else {
           index = -index
        }
        
//        [1,2,3,3,3,5,6]  (arr, 3, 3)

        while count < k {
            print("left=\(left), right=\(right), count=\(count)")

            if count == 0 {
                let current = arr[index]
                if index < len {
                    let rightNum = arr[index + 1]
                    if x - current <= rightNum - x {
                        array.append(index)
                    } else {
                        array.append(index + 1)
                        right += 1
                    }
                    count += 1
                }
            }
            
            if x - arr[left] <= arr[right] - x {
                array.append(left)
                if left > 0 {
                    left -= 1
                }
            } else {
                array.append(right)
                if right < len {
                    right += 1
                }
            }
            
            count += 1
        }
        
        return array
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
            return end + 1
        }
        
        while sortedArr[middle] != num {
            middle = (start + end) / 2
            print("start=\(start), end=\(end), mid=\(middle)")
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
