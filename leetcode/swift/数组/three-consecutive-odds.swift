// https://leetcode-cn.com/problems/three-consecutive-odds/

/**
执行用时：24 ms, 在所有 Swift 提交中击败了100.00%的用户
内存消耗：13.6 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class ThreeConsecutiveOdds {
    func threeConsecutiveOdds(_ arr: [Int]) -> Bool {
        var i = 0, count = 0
        let n = arr.count 
        for i in 0 ..< arr.count {
            if arr[i] % 2 == 1 {
                count += 1
                if count == 3 {
                    return true
                }
            } else {
                count = 0
            }
        }
        return false
    }
}
