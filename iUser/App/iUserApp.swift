//
//  iUserApp.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

import SwiftUI

@main
struct iUserApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(PopupManager.shared)
                .overlay(
                    PopupView()
                        .environmentObject(PopupManager.shared)
                )
        }
    }
}
