// https://leetcode-cn.com/problems/two-sum/

/**
哈希表 O(n)

执行用时：36 ms, 在所有 Swift 提交中击败了98.42%的用户
内存消耗：14.1 MB, 在所有 Swift 提交中击败了98.64%的用户
*/
class TwoSum {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count < 1 {
            return []
        }
        var map = [Int:Int]()
        var anotherNum = 0
        for i in 0 ..< nums.count {
            anotherNum = target - nums[i]
            if map[anotherNum] == nil {
                 map[nums[i]] = i
            } else {
                return [map[anotherNum]!, i]
            }
        }
        return []
    }
}

/**
双指针 O(n*logN)

执行用时：44 ms, 在所有 Swift 提交中击败了68.39%的用户
内存消耗：13.7 MB, 在所有 Swift 提交中击败了99.59%的用户
*/
class TwoSum_68 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count < 1 {
            return []
        }
        let sortedNums = nums.sorted()
        var left = 0
        var right = nums.count - 1
        if target < 0 {
            if sortedNums[left] > 0 || 2 * sortedNums[left] > target {
                return []
            }
        } else if target > 0 {
            if sortedNums[right] < 0 || 2 * sortedNums[right] < target {
                return []
            }
        } else {
            if !(sortedNums[left] <= 0 && sortedNums[right] >= 0) {
                return []
            }
        }

        while left < right {
            if sortedNums[left] + sortedNums[right] == target {
                let leftIndex = nums.firstIndex(of: sortedNums[left])!
                let rightIndex = nums.lastIndex(of: sortedNums[right])!
                return [leftIndex, rightIndex]
            } else if sortedNums[left] + sortedNums[right] < target {
                left += 1
            } else {
                right -= 1
            }
        }
        return []
    }
}

/**
暴力穷举法 O(n*n)

执行用时：752 ms, 在所有 Swift 提交中击败了7.45%的用户
内存消耗：14 MB, 在所有 Swift 提交中击败了98.91%的用户
*/
class TwoSum_7 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0 ..< nums.count - 1 {
            for j in i + 1 ..< nums.count {
                if nums[j] == (target - nums[i]) {
                    return [i, j]
                }
            }
        }
        return []
    }
}
