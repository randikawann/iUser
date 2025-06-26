//
//  iUserApp.swift
//  iUser
//
//  Created by Arimac on 2025-06-26.
//

import SwiftUI

@main
struct iUserApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
