
// https://leetcode-cn.com/problems/4sum/

class FourSumCount {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var tuple = [Int]()
        var result = [[Int]]()
        if nums.count < 4 {
            return result
        }
        
        var nums = nums.sorted()
        if target > 0 {
            if nums.first! > target || 4 * nums.last! < target {
                return result
            }
        } else if target < 0 {
            if nums.last! < target || 4 * nums.first! > target {
                return result
            }
        } else {
            if nums.first! == 0 && nums.last! == 0 {
                return [[0, 0, 0, 0]]
            }
        }

        for i in 0 ..< nums.count - 3 {
            // i 去重
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }
            if target <= 0 && nums[i] > 0 {
                break
            }
            for j in i+1 ..< nums.count - 2 {
                if j > i+1 && nums[j] == nums[j-1] {
                    continue
                }
                var left = j + 1
                var right = nums.count - 1 
                while left < right {
                    if nums[i] + nums[j] + nums[left] + nums[right] == target {
                        tuple = [nums[i], nums[j], nums[left], nums[right]]
                        result.append(tuple)
                        while left < right && nums[left] == nums[left+1] {
                            left += 1
                        }
                        while left < right && nums[right] == nums[right-1] {
                            right -= 1
                        }
                        left += 1
                        right -= 1
                    } else if nums[i] + nums[j] + nums[left] + nums[right] < target{
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
        }
        return result
    } 
}
