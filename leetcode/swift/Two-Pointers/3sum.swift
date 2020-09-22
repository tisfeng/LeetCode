// https://leetcode-cn.com/problems/3sum/

/**
执行用时：632 ms, 在所有 Swift 提交中击败了14.38%的用户
内存消耗：17.2 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class ThreeSum {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var tuple = [Int]()
        var result = [[Int]]()
        let nums = nums.sorted()

        if nums.count < 3 || nums.last! < 0 || nums.first! > 0 {
            return result
        }
        if nums.first! == 0 && nums.last! == 0 {
            return [[0, 0, 0]]
        }

        for i in 0 ..< nums.count-2 {
            if nums[i] > 0 {
                break
            }
            // i位去重
            if i > 0 && nums[i] == nums[i-1] { // [-40, -1, -1, 0, 1, 2]
                continue
            }
            var left = i + 1
            var right = nums.count - 1
            //左右临界判断。若a+b+c=0，且a<=b<=c，则应满足 [a <= -2*b] && [a >= -2*c]
            if nums[i] > -2 * nums[left] || nums[i] < -2 * nums[right] {
                continue
            }

            while left < right {
                if nums[left] + nums[right] == -nums[i] {
                        tuple = [nums[i], nums[left], nums[right]]
                        result.append(tuple)
                        
                        while left < right && nums[left] == nums[left+1]  {
                            left += 1
                        }
                        while left < right && nums[right] == nums[right-1] {
                            right -= 1
                        }

                        left += 1
                        right -= 1
                        
                    }  else if nums[left] + nums[right] < -nums[i] {
                        left += 1
                    } else {
                        right -= 1
                    }
            }
        }
        return result
    }
}

/**
执行用时：932 ms, 在所有 Swift 提交中击败了10.62%的用户
内存消耗：18.6 MB, 在所有 Swift 提交中击败了94.94%的用户
*/
class ThreeSum_10 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var tuple = [Int]()
        var tupleSet = Set<[Int]>()
        var result = [[Int]]()
        var map = [Int:Int]()
        var zeroCount = 0
        var myNums = [Int]()
        
        var tempMap = [Int:Int]()
        for i in 0 ..< nums.count {
            if nums[i] == 0 {
                if zeroCount < 3 {
                    myNums.append(nums[i])
                    zeroCount += 1
                    if map[nums[i]] == nil {
                        map[nums[i]] = myNums.count - 1
                    }
                } // [0, 0, 1,2,1,1,2,2,0, 1,2,0,0,1]
            }  else {
                if tempMap[nums[i]] == nil {
                    myNums.append(nums[i])
                    tempMap[nums[i]] = 1
                    map[nums[i]] = myNums.count - 1
                } else if tempMap[nums[i]] == 1 {
                    myNums.append(nums[i])
                    tempMap[nums[i]] = -1
                }
            }
        }
        //  print(myNums)
        
        if myNums.count == 3 && zeroCount == 3 {
            return [[0, 0, 0]]
        }
        
        for i in 0 ..< myNums.count {
            for j in i+1..<myNums.count {
                let anotherNum = -(myNums[i] + myNums[j])
                if map[anotherNum] != nil
                    && !(anotherNum == myNums[i] && map[anotherNum]! == i)
                    && !(anotherNum == myNums[j] && map[anotherNum]! == j)
                {
                    tuple = [myNums[i], anotherNum, myNums[j]]
                    result.append(tuple)
                }
            }
        }
        for tuple in result {
            let sortedArr = tuple.sorted()
            tupleSet.insert(sortedArr)
        }
        
        result = Array(tupleSet)
        
        return result
    }
}

/**
超时
*/
class ThreeSum_0 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let sortedNums = nums.sorted()
        var usedMap = [Int:Int]()
        let length = sortedNums.count
        if length < 3 {
            return result
        }
        
        var zeroCount = 0
        let zeroIndex = searchNum(0, inArray: sortedNums)
        if zeroIndex >= 0 {
            for index in zeroIndex..<length {
                if sortedNums[index] == 0 {
                    zeroCount += 1
                } else {
                    break
                }
            }
        }
        if zeroCount >= 3 {
            result.append([0, 0, 0])
        }
        if sortedNums.first! == sortedNums.last! {
            return result
        }
        
        for i in 0 ..< length - 2 {
            if sortedNums[i] > 0 {
                break
            }
            if i != 0 && sortedNums[i] == sortedNums[i-1]
                && usedMap[sortedNums[i]] != nil {
                continue
            }
            for j in (i+1 ..< length).reversed() {
                if j != length - 1 && sortedNums[j] == sortedNums[j+1]
                    && (usedMap[sortedNums[j]] != nil
                        && usedMap[sortedNums[j]] != usedMap[sortedNums[i]]) {
                    continue
                }
                let anotherNum = -(sortedNums[i] + sortedNums[j])
                let secondIndex = searchNum(anotherNum, inArray: sortedNums)
                if secondIndex < 0 || secondIndex < i || secondIndex > j {
                    continue
                } else {
                    let maxIndex = searchNumMaxIndex(anotherNum, inArray: sortedNums)
                    if secondIndex == i || secondIndex == j {
                        if secondIndex == maxIndex
                            || sortedNums[maxIndex] == 0
                        {
                            continue
                        }
                    }
                    
                    let arr = [sortedNums[i], anotherNum, sortedNums[j]]
                    result.append(arr)
                    usedMap[sortedNums[i]] = i
                    usedMap[sortedNums[j]] = j
                }
            }
        }
        return result
    }
    
    func searchNumMaxIndex(_ num: Int, inArray sortedArr: [Int]) -> Int {
        let minIndex = searchNum(num, inArray: sortedArr)
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
     若num不在数组的范围，返回最小负数 Int.min
     */
    func searchNum(_ num: Int, inArray sortedArr:[Int]) -> Int {
        var start = 0
        var end = sortedArr.count - 1
        var middle = (start + end) / 2
        
        if num > sortedArr.last! || num < sortedArr.first! {
            return Int.min
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
