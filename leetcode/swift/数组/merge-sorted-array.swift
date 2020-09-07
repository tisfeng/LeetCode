// https://leetcode-cn.com/problems/merge-sorted-array/

/**
执行用时：12 ms, 在所有 Swift 提交中击败了96.61%的用户
内存消耗：21.1 MB, 在所有 Swift 提交中击败了18.42%的用户
*/
class MergeSortedArray {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        // 备份 nums1 中的有效元素
        var nums = [Int]()
        for i in 0 ..< m {
            nums.append(nums1[i])
        }
        var i = 0 // nums 指针
        var j = 0 // nums2 指针
        var index = 0 // nums1 指针
        // 填充数组长度较小的有效元素
        while i < m && j < n { 
            if nums2[j] < nums[i] {
                nums1[index] = nums2[j]
                j += 1
            } else {
                nums1[index] = nums[i]
                i += 1
            }
            index += 1
        }
        // 填充另一数组的有效元素
        if j < n {
            for k in j ..< n {
                nums1[index] = nums2[j]
                j += 1
                index += 1
            }
        } else {
            for k in i ..< m {
                nums1[index] = nums[i]
                i += 1
                index += 1
            }
        } 
    }
}

/**
执行用时：16 ms, 在所有 Swift 提交中击败了71.67%的用户
内存消耗：21.1 MB, 在所有 Swift 提交中击败了18.42%的用户
*/
class MergeSortedArray_71 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        // 移除多余的0
        for i in m ..< nums1.count {
            nums1.removeLast()
        }
        if m == 0 || n == 0 {
            nums1 += nums2
            return
        }
        var i = 0, j = 0
        while i < nums1.count && j < n {
            if nums1[i] > nums2[j] {
                nums1.insert(nums2[j], at: i)
                j += 1
            } 
            i += 1
        }
        if i < m + n { // nums1 已遍历完，接下来插入剩余的 nums2
            for index in j ..< n {
                nums1.append(nums2[index])
            } 
        }
    }
}
