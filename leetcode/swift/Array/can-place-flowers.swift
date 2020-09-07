// https://leetcode-cn.com/problems/can-place-flowers/

/**
执行用时：124 ms, 在所有 Swift 提交中击败了100.00%的用户
内存消耗：13.7 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class CanPlaceFlowers {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        let len = flowerbed.count
        if len == 1 && flowerbed[0] == 0 {
            return true
        }

        var zeroCount = 0 // 连续0的个数
        var placeCount = 0 // 3个0为一个种植地
        for i in 0 ..< len {
            if flowerbed[i] == 0 {
                zeroCount += 1
                if zeroCount == 2 { // 特殊边界： [0,0,1]、[1,0,0]
                    if i == 1 || i == len - 1 {
                        zeroCount = 3
                    }
                }
            } else {
                zeroCount = 0
            }
            if zeroCount == 3 {
                placeCount += 1
                zeroCount = 1
            }
        }

        if placeCount >= n {
            return true
        } else {
            return false
        }
    }
}
