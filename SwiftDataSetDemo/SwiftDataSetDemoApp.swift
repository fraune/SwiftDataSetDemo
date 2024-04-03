//
//  SwiftDataSetDemoApp.swift
//  SwiftDataSetDemo
//
//  Created by Brandon Fraune on 4/2/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataSetDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Bird.self)
    }
}
