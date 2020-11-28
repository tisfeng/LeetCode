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
                let arr = [1,0,0,0]
                print(solution.maxDistToClosest(arr))           
                
            }
        }
    }
}
