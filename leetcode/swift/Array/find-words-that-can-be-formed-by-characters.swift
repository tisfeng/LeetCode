//
//  find-words-that-can-be-formed-by-characters.swift
//  leetcode
//
//  Created by tisfeng on 2020/12/5.
//

import Foundation


/**
 1160. 拼写单词 https://leetcode-cn.com/problems/find-words-that-can-be-formed-by-characters/
 
 输入：words = ["cat","bt","hat","tree"], chars = "atach"
 输出：6
 解释：
 可以形成字符串 "cat" 和 "hat"，所以答案是 3 + 3 = 6。
 */


/**
 超时
 */
class Solution {
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
