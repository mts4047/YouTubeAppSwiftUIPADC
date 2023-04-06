//
//  YouTubeAppSwiftUIPADCApp.swift
//  YouTubeAppSwiftUIPADC
//
//  Created by Myo Thandar soe on 07/04/2023.
//

import SwiftUI

@main
struct YouTubeAppSwiftUIPADCApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
