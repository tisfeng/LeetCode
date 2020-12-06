//
//  find-words-that-can-be-formed-by-characters.swift
//  leetcode
//
//  Created by tisfeng on 2020/12/5.
//

import Foundation


/**
 1160. 拼写单词 https://leetcode-cn.com/problems/find-words-that-can-be-formed-by-characters/
 
 输入：words = ["cat","bt","hatt","tree"], chars = "atach"
 输出：3
 解释：
 可以形成字符串 "cat"，所以答案是 3
 */

/**
 执行用时：280 ms, 在所有 Swift 提交中击败了36.36%的用户
 内存消耗：14.4 MB, 在所有 Swift 提交中击败了45.45%的用户
 */
class Solution {
    func countCharacters(_ words: [String], _ chars: String) -> Int {
        var count = 0
        var map = [Character: Int]()
        for char in chars {
            let value = map[char]
            if value != nil {
                map[char] = value! + 1
            } else {
                map[char] = 1
            }
        }
        
        for i in 0..<words.count {
            let word = words[i]
            var k = 0
            var tempMap = map
//            print("word: \(word)")
            
            if word.count > chars.count {
                continue
            }
            
            for char in word {
                let charCount = tempMap[char]
//                print("char: \(char), charCount: \(charCount ?? 0)")
                if charCount != nil && charCount! > 0 {
                    tempMap[char] = charCount! - 1
                    k += 1
//                    print("match: \(char), \(tempMap)")
                    if k == word.count {
                        count += word.count
//                        print("push word: \(word), count: \(count)\n")
                    }
                } else {
//                    print("continue, \(word)")
                    break;
                }
            }
        }
        
        return count
    }
}

/**
 超时，暴力遍历查找
 */
class CountCharacters_0 {
    func countCharacters(_ words: [String], _ chars: String) -> Int {
        var count = 0
        for i in 0..<words.count {
            let word = words[i]
            var k = 0
            for char in word {
                if chars.contains(char) {
                    k += 1
                    if k == word.count {
                        count += word.count
                    }
                }
            }
        }
        
        return count
    }
}
