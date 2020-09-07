// https://leetcode-cn.com/problems/contains-duplicate-ii/

/**
执行用时：116 ms, 在所有 Swift 提交中击败了100.00%的用户
内存消耗：17.3 MB, 在所有 Swift 提交中击败了95.24%的用户
*/
class ContainsNearbyDuplicate {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var map = [Int: Int]()
        for i in 0 ..< nums.count {
            let val = nums[i]
            if let index = map[val] {
                if i - index <= k {
                    return true
                } else {
                    map[val] = i
                }
            } else {
                map[val] = i
            }
        }
        return false
    }
}
