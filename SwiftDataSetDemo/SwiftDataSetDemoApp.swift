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
