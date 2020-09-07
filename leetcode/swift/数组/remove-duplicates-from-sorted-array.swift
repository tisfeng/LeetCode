//  https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array/

/**
执行用时：92 ms, 在所有 Swift 提交中击败了73.37%的用户
内存消耗：21.2 MB, 在所有 Swift 提交中击败了76.74%的用户
*/
class RemoveDuplicates {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let length = nums.count
        if length < 2 {
            return length
        }
        var reversedIndex = length - 1
        while reversedIndex > 0 {
            if nums[reversedIndex] == nums[reversedIndex - 1] {
                nums.remove(at: reversedIndex)
            }
            reversedIndex -= 1
        }
        return nums.count
    }
}

/**
执行用时：96 ms, 在所有 Swift 提交中击败了51.40%的用户
内存消耗：21.2 MB, 在所有 Swift 提交中击败了78.61%的用户
*/
class RemoveDuplicates_51 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let length = nums.count
        guard length > 1 else {
            return length
        }
        for i in (0 ..< length - 1).reversed() {
            if nums[i] == nums[i+1] {
                nums.remove(at: i)
            }
        }
        return nums.count
    }
}

/**
执行用时：100 ms, 在所有 Swift 提交中击败了37.68%的用户
内存消耗：21.3 MB, 在所有 Swift 提交中击败了67.91%的用户
*/
class RemoveDuplicates_37 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count < 2 {
            return nums.count
        } 
        var left = 0
        var right = nums.count - 2
        while left <= right {
           while left <= right && nums[right] == nums[right+1] {
               nums.remove(at: right)
               right -= 1
           }
           while left <= right && left > 0 && nums[left] == nums[left-1] {
               nums.remove(at: left) 
               right -= 1
           } 
           left += 1
        }
        return nums.count
    }
}

/**
执行用时：1012 ms, 在所有 Swift 提交中击败了5.06%的用户
内存消耗：21.3 MB, 在所有 Swift 提交中击败了65.58%的用户
*/
class RemoveDuplicates_5 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let length = nums.count
        if length < 2 {
            return length
        } 
        var n = length
        var left = 0
        var right = length - 1
        var lastIndex = right
        while left <= right { //[1,1,1]
            while left <= right && right > 0 && nums[right] == nums[right - 1] { 
                right -= 1
                n -= 1
            } 
            for i in 1 ..< n - right {
                nums[right + i] = nums[lastIndex + i - 1]
            }
            lastIndex = right // 后面有效元素
            right -= 1
        }
        return n
    }
}
