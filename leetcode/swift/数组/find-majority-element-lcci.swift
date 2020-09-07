// https://leetcode-cn.com/problems/find-majority-element-lcci/

/**
执行用时：160 ms, 在所有 Swift 提交中击败了93.94%的用户
内存消耗：15.7 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class MajorityElement {
    func majorityElement(_ nums: [Int]) -> Int {
        let n = nums.count 
        if n == 1 {
            return nums[0]
        }
        var map = [Int: Int]()
        for i in 0 ..< n {
            let val = nums[i]
            if let count = map[val] {
                map[val] = count + 1
                if map[val]! > n / 2 {
                    return val
                }
            } else {
                map[val] = 1
            }
        }
        return -1
    }
}
