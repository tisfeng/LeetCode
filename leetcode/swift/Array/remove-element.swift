// https://leetcode-cn.com/problems/remove-element/

/**
执行用时：12 ms, 在所有 Swift 提交中击败了74.50%的用户
内存消耗：21 MB, 在所有 Swift 提交中击败了34.57%的用户
*/
class RemoveElement {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        while i < nums.count {
            if nums[i] == val {
                nums.remove(at: i)
            } else {
                i += 1
            }
        }
        return nums.count
    }
}

/**
双指针：将val移至数组末尾

执行用时：8 ms, 在所有 Swift 提交中击败了95.97%的用户
内存消耗：20.8 MB, 在所有 Swift 提交中击败了87.65%的用户
*/
class RemoveElement_95 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var n = nums.count
        var i = 0
        while i < n {
            if nums[i] == val {
                nums[i] = nums[n - 1]
                n -= 1
            } else {
                i += 1
            }
        }
        return n
    }
}

/**
双指针：顺序复制

执行用时：12 ms, 在所有 Swift 提交中击败了74.50%的用户
内存消耗：21 MB, 在所有 Swift 提交中击败了28.39%的用户
*/
class RemoveElement_70 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        for j in 0 ..< nums.count {
            if nums[j] != val {
                nums[i] = nums[j]
                i += 1
            }
        }
        return i
    }
}

/**
执行用时：12 ms, 在所有 Swift 提交中击败了74.59%的用户
内存消耗：20.9 MB, 在所有 Swift 提交中击败了67.53%的用户
*/
class RemoveElement_74 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var reversedIndex = nums.count - 1
        while reversedIndex >= 0 {
            if nums[reversedIndex] == val {
                nums.remove(at: reversedIndex)
            }
            reversedIndex -= 1
        }
        return nums.count
    }
}



/**
执行用时：16 ms, 在所有 Swift 提交中击败了32.01%的用户
内存消耗：20.9 MB, 在所有 Swift 提交中击败了49.35%的用户
*/
class RemoveElement_32 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        for i in (0 ..< nums.count).reversed() {
            if nums[i] == val {
                nums.remove(at: i)
            }
        }
        return nums.count
    }
}
