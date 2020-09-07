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
                let solution = CanPlaceFlowers()
                print(solution.canPlaceFlowers([0,0,1], 1))
            }
        }
    }
}
