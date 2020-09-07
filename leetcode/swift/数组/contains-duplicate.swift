// https://leetcode-cn.com/problems/contains-duplicate/

/**
执行用时：176 ms, 在所有 Swift 提交中击败了100.00%的用户
内存消耗：17.7 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class ContainsDuplicate {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var map = [Int: Int]()
        for i in 0 ..< nums.count {
            let val = nums[i]
            if map[val] != nil {
                return true
            } else {
                map[val] = i
            }
        }
        return false
    }
}
