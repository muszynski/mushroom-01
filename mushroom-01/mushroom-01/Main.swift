//
//  mushroom_01App.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 13/03/2023.
//

import SwiftUI

@main
struct MushroomApp: App {
    @StateObject private var persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            Mushroom()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
