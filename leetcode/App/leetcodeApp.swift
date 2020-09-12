//
//  leetcodeApp.swift
//  leetcode
//
//  Created by isfeng on 2020/9/6.
//

import SwiftUI

@main
struct leetcodeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().onAppear {
                let solution = Solution()
                let arr = [[3,2,9,2,7],[6,1,8,4,2],[7,5,3,2,7],[2,9,4,9,6],[4,3,8,2,5]]
                print(solution.numMagicSquaresInside(arr))
            }
        }
    }
}
