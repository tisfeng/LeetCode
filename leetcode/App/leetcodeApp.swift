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
                let solution = FlipAndInvertImage()
                print(solution.flipAndInvertImage([[1,0,0,0]]))
            }
        }
    }
}
