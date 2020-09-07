// https://leetcode-cn.com/problems/maximum-product-of-three-numbers/

/**
1. 不排序，一遍遍历获取几个需要的最大最小元素值 O(n)

执行用时：316 ms, 在所有 Swift 提交中击败了100.00%的用户
内存消耗：14 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class MaximumProduct {
    func maximumProduct(_ nums: [Int]) -> Int {
        var max1 = 0, max2 = 0, max3 = 0
        var min1 = 0, min2 = 0
        let n = nums.count
        for i in 1 ..< n {
            if i == 2 {
                var arr = Array(nums.prefix(3))
                arr = arr.sorted(by: >)
                max1 = nums.index(of: arr[0])!
                max2 = nums.index(of: arr[1])!
                max3 = nums.index(of: arr[2])!
            } else if i > 2 {
                 if nums[i] > nums[max1] { // [1,2,3]
                        max3 = max2
                        max2 = max1
                        max1 = i
                    } else if nums[i] > nums[max2] {
                        max3 = max2
                        max2 = i
                    } else if nums[i] > nums[max3] {
                        max3 = i
                    } else if nums[i] < nums[i - 1] && i < 3 {
                        max2 = max3
                        max3 = i
                    }   
            }
            
            if nums[i] < nums[min1] { // -2,-1,-3
                min2 = min1
                min1 = i
            } else if nums[i] < nums[min2] { // -3,-1,-2
                min2 = i
            } else if nums[i] > nums[i - 1] && i < 2 { // -3,-2,-1  1,2,3
                min1 = min2
                min2 = i
            }
        }

        let maxProduct1 = nums[max1] * nums[max2] * nums[max3]
        let maxProduct2 = nums[max1] * nums[min1] * nums[min2]

        return max(maxProduct1, maxProduct2)
    }
}

/**
2. 排序，O(n*logn)

执行用时：696 ms, 在所有 Swift 提交中击败了23.53%的用户
内存消耗：21.3 MB, 在所有 Swift 提交中击败了50.00%的用户
*/
class MaximumProduct_23 {
    func maximumProduct(_ nums: [Int]) -> Int {
        var nums = nums.sorted()
        let n = nums.count - 1
        let max1 = nums[n] * nums[n - 1] * nums[n - 2]
        if nums[0] >= 0 {
            return max1
        } else {
            let max2 = nums[0] * nums[1] * nums[n]
            return max(max1, max2)
        }
    }
}

/**
执行用时：672 ms, 在所有 Swift 提交中击败了52.94%的用户
内存消耗：21.3 MB, 在所有 Swift 提交中击败了50.00%的用户
*/
class MaximumProduct_52 {
    func maximumProduct(_ nums: [Int]) -> Int {
        var nums = nums.sorted()
        let n = nums.count - 1
        let max1 = nums[n] * nums[n - 1] * nums[n - 2]
        let max2 = nums[0] * nums[1] * nums[n]
        return max(max1, max2)
    }
}
