// https://leetcode-cn.com/problems/4sum-ii/

// 哈希 2+2

/**
执行用时：244 ms, 在所有 Swift 提交中击败了100.00%的用户
内存消耗：31.8 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class FourSumCount2 {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        var resultCount = 0
        let length = A.count
        var map = [Int: Int]()
        
        for i in 0 ..< length {
            for j in 0 ..< length {
                let sum = A[i] + B[j]
                if let count = map[sum] {
                    map[sum] = count + 1
                } else {
                    map[sum] = 1
                }
            }
        }
        for i in 0 ..< length {
            for j in 0 ..< length {
                let sum = C[i] + D[j]
                if let count = map[-sum] {
                    resultCount += count
                }
            }
        }

        return resultCount
    }
}

/**
执行用时：240 ms, 在所有 Swift 提交中击败了100.00%的用户
内存消耗：31.6 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class FourSumCount2_100 {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        var resultCount = 0
        let length = A.count
        var map = [Int: Int]()
        
        for i in 0 ..< length {
            for j in 0 ..< length {
                let sum = A[i] + B[j]
                let count = map[sum] ?? 0
                map[sum] = count + 1
            }
        }
        for i in 0 ..< length {
            for j in 0 ..< length {
                let sum = C[i] + D[j]
                let count = map[-sum] ?? 0
                resultCount += count
            }
        }

        return resultCount
    }
}

/**
执行用时：312 ms, 在所有 Swift 提交中击败了93.33%的用户
内存消耗：31.2 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class FourSumCount2_93 {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        var resultCount = 0
        let length = A.count
        var map = [Int: Int]()
        
        for i in 0 ..< length {
            for j in 0 ..< length {
                let sum = A[i] + B[j]
                if map[sum] == nil {
                    map[sum] = 1
                } else {
                    map[sum] = map[sum]! + 1
                }
            }
        }
        for i in 0 ..< length {
            for j in 0 ..< length {
                let sum = C[i] + D[j]
                if map[-sum] != nil {
                    resultCount += map[-sum]!
                }
            }
        }

        return resultCount
    }
}

/**
执行用时：240 ms, 在所有 Swift 提交中击败了100.00%的用户
内存消耗：31.7 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class FourSumCount2_95 {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        var resultCount = 0
        let length = A.count
        var map = [Int: Int]()
        
        for i in 0 ..< length {
            for j in 0 ..< length {
                let sum = A[i] + B[j]
                guard let count = map[sum] else {
                    map[sum] = 1
                    continue
                }
                map[sum] = count + 1
            }
        }
        for i in 0 ..< length {
            for j in 0 ..< length {
                let sum = C[i] + D[j]
                guard let count = map[-sum] else {
                    continue
                }
                resultCount += count
            }
        }

        return resultCount
    }
}

/**
执行用时：420 ms, 在所有 Swift 提交中击败了80.00%的用户
内存消耗：31.7 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class FourSumCount2_80 {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        var resultCount = 0
        var map = [Int: Int]()

        for a in A {
            for b in B {
                let sum = a + b
                if let count = map[sum] {
                    map[sum] = count + 1
                } else {
                    map[sum] = 1
                }
            }
        } 
        for c in C {
            for d in D {
                if let count = map[-c-d] {
                    resultCount += count
                }
            }
        }

        return resultCount
    }
}

/**
执行用时：416 ms, 在所有 Swift 提交中击败了86.67%的用户
内存消耗：31.8 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class FourSumCount2_86 {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        var resultCount = 0
        var map = [Int: Int]()
        
        for a in A {
            for b in B {
                let count = map[a+b] ?? 0
                map[a+b] = count + 1
            }
        }
        for c in C {
            for d in D {
                let count = map[-c-d] ?? 0
                resultCount += count
            }
        }

        return resultCount
    }
}

/**
执行用时：460 ms, 在所有 Swift 提交中击败了53.33%的用户
内存消耗：31.6 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class FourSumCount2_53 {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        var count = 0
        var map = [Int: Int]()

        for a in A {
            for b in B {
                if map[a+b] == nil {
                    map[a+b] = 1
                } else {
                    map[a+b] = map[a+b]! + 1
                }
            }
        } 
        for c in C {
            for d in D {
                if map[-c-d] != nil {
                    count += map[-c-d]!
                }
            }
        }

        return count
    }
}

// 哈希法 3+1，超时。。
class FourSumCount2_0 {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        var count = 0
        let length = A.count
        var map = [Int: Int]()
        var anotherNum = 0

        for num in D {
            if map[num] == nil {
                map[num] = 1
            } else {
                map[num] = map[num]! + 1
            }
        }

        for i in 0 ..< length {
            for j in 0 ..< length {
                for k in 0 ..< length {
                    anotherNum = -(A[i] + B[j] + C[k])
                    if map[anotherNum] != nil {
                        count += map[anotherNum]!
                    } 
                }
            }
        }

        return count
    }
}
