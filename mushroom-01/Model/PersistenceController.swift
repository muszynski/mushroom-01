//
//  PersistenceController.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 19/03/2023.
//

import CoreData

class PersistenceController: ObservableObject {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Model")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }

    #if DEBUG
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newMushroom = MushroomData(context: viewContext)
            newMushroom.id = UUID()
            newMushroom.typeMushroom = "Some mushroom"
            newMushroom.size = 10
            newMushroom.forestType = "Forest"
            newMushroom.creationDate = Date()
            newMushroom.long = 21.01
            newMushroom.lat = 52.23
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
        return result
    }()
    #endif
}
