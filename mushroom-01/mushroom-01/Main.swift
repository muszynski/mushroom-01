//
//  mushroom_01App.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 13/03/2023.
//

import SwiftUI
import CoreData

@main
struct MushroomApp: App {
    @StateObject private var persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            MushroomTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
