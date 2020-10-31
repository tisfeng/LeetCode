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
//                let solution = Solution()
//                let arr = [-2,1,-3,4,-1,2,1,-5,4]
//                print(solution.maxSubArray(arr))
                
                let solution = Fib()
            
                print(solution.fib(40))
                
            }
        }
    }
}
