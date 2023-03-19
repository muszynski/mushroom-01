//
//  saveMushroom.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 19/03/2023.
//

import Foundation
import CoreData
import UIKit

func saveMushroom(managedObjectContext: NSManagedObjectContext, inputImage: UIImage?, name: String, size: Int, isFavorite: Bool) {
    guard let imageData = inputImage?.jpegData(compressionQuality: 1.0) else {
        print("Failed to convert inputImage to Data")
        return
    }

    let mushroom = Mushroom(context: managedObjectContext)
    mushroom.id = UUID()
    mushroom.name = name
    mushroom.size = Int16(size)
    mushroom.isFavorite = isFavorite
    mushroom.imageData = imageData

    do {
        try managedObjectContext.save()
        print("Mushroom saved successfully")
    } catch {
        print("Error saving mushroom: \(error)")
    }
}
