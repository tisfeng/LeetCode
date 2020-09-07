// https://leetcode-cn.com/problems/contains-duplicate-iii/

/**
执行用时：80 ms, 在所有 Swift 提交中击败了7.69%的用户
内存消耗：14.3 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class ContainsNearbyAlmostDuplicate {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        let n = nums.count
        if k == 0 || n < 2 {
            return false
        }

        if t == 0 {
            return containsNearbyDuplicate(nums, k)
        }

        for i in 0 ..< n - 1 {
            for j in i + 1 ... min(i + k, n - 1) {
                if abs(nums[j] - nums[i]) <= t {
                    return true
                }
            }
        } 
        return false
    }

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
