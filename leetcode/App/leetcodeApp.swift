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
                let arr = [0,1,2,2,2,3,6,8,8,9]
                print(solution.findClosestElements(arr, 5, 9))
            }
        }
    }
}
