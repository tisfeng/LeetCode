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
                let arr = [1,2,3,3,3,5,6]
                print(solution.findClosestElements(arr, 3, 4))
            }
        }
    }
}
