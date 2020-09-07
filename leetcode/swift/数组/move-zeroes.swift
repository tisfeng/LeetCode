// https://leetcode-cn.com/problems/move-zeroes/

/**
执行用时：44 ms, 在所有 Swift 提交中击败了97.71%的用户
内存消耗：21.3 MB, 在所有 Swift 提交中击败了42.74%的用户
*/
class MoveZeroes {
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0 
        let n = nums.count
        for j in 0 ..< n {
            if nums[j] != 0 {
                nums[i] = nums[j]
                i += 1
            } 
        }
        for j in i ..< n {
            nums[j] = 0
        }
    }
}

/**
执行用时：56 ms, 在所有 Swift 提交中击败了33.08%的用户
内存消耗：21.1 MB, 在所有 Swift 提交中击败了86.32%的用户
*/
class MoveZeroes_33 {
    func moveZeroes(_ nums: inout [Int]) {
        for i in (0 ..< nums.count).reversed() {
            if nums[i] == 0 {
                nums.remove(at: i)
                nums.append(0)
            }
        }
    }
}


/**
执行用时：52 ms, 在所有 Swift 提交中击败了68.96%的用户
内存消耗：21.3 MB, 在所有 Swift 提交中击败了55.56%的用户
*/
class MoveZeroes_68 {
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0
        var n = nums.count - 1 //最大移动次数
        while i < n {
            if nums[i] == 0 {
                nums.remove(at: i)
                nums.append(0)
                n -= 1
            } else {
                i += 1
            }
        }
    }
}
