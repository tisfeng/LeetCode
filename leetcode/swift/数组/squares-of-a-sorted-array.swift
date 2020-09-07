// https://leetcode-cn.com/problems/squares-of-a-sorted-array/

/**
因为平方会破坏数组的有序性，浪费已知条件，因此必须想办法先排序

双指针（有序数组），先排序，再平方 O(n)

执行用时：344 ms, 在所有 Swift 提交中击败了52.33%的用户
内存消耗：21.7 MB, 在所有 Swift 提交中击败了100.00%的用户
*/
class SortedSquares {
    func sortedSquares(_ A: [Int]) -> [Int] {
        var sortedA = A   
        let length = A.count   
        var left = 0
        var right = length - 1
        var i = right
        while left <= right {
            if abs(A[left]) > abs(A[right]) {
                sortedA[i] = A[left]
                left += 1
            } else {
                sortedA[i] = A[right]
                right -= 1
            }
            i -= 1   
        }
        for i in 0 ..< length {
            sortedA[i] *= sortedA[i]
        }
        return sortedA
        // return sortedA.map { $0 * $0}  //{ n in n*n}
    }
}

/**
超时（冒泡排序）
*/
class SortedSquares_0 {
    func sortedSquares(_ A: [Int]) -> [Int] {
        let length = A.count
        var isNeedSwap: Bool
        var A = A
        for i in 0 ..< length - 1 {
            isNeedSwap = false
            for j in 0 ..< length - i - 1 {
                if abs(A[j]) > abs(A[j + 1]) {
                    A.swapAt(j, j + 1)
                    isNeedSwap = true
                } 
            }
            if !isNeedSwap {
                break
            }
        }
        return A.map { n in n*n}
    }
}

/** 
暴力法，先排序，再平方 O(n*logn)

执行用时：596 ms, 在所有 Swift 提交中击败了5.81%的用户
内存消耗：22.4 MB, 在所有 Swift 提交中击败了75.00%的用户
*/
class SortedSquares_5 {
    func sortedSquares(_ A: [Int]) -> [Int] {
        let A = A.sorted { abs($0) < abs($1) }
        return A.map { $0 * $0 }
    }
}

/** 
暴力法，直接平方，然后再排序 O(n*logn)

执行用时：496 ms, 在所有 Swift 提交中击败了27.91%的用户
内存消耗：22.5 MB, 在所有 Swift 提交中击败了50.00%的用户
*/
class SortedSquares_27 {
    func sortedSquares(_ A: [Int]) -> [Int] {
        var arr = [Int]()
        for i in 0 ..< A.count {
            arr.append(A[i] * A[i])
        }
        return arr.sorted()
    }
}
