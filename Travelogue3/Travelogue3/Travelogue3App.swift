//
//  Travelogue3App.swift
//  Travelogue3
//
//  Created by Robert Olson on 12/5/23.
//

import SwiftUI
import SwiftData

@main
struct Travelogue3App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Trip.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
