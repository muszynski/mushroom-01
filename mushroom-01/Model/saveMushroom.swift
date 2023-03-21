//
//  saveMushroom.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 19/03/2023.
//

import Foundation
import CoreData
import UIKit

class MushroomManager{
    func saveMushroom(managedObjectContext: NSManagedObjectContext, inputImage: UIImage?, name: String, size: Int, isFavorite: Bool, long: Double, lat: Double) {
        guard let imageData = inputImage?.jpegData(compressionQuality: 1.0) else {
            print("Failed to convert inputImage to Data")
            return
        }
        // błąd był generowany przez to że Persistance Controller nie był Observed Objcet
        let mushroomData = MushroomData(context: managedObjectContext)
        mushroomData.id = UUID()
        mushroomData.typeMushroom = name
        mushroomData.size = Int16(size)
        mushroomData.isFavorite = isFavorite
        mushroomData.imageData = imageData
        mushroomData.creationDate = Date()
        mushroomData.long = long
        mushroomData.lat = lat
        
        do {
            try managedObjectContext.save()
            print("Mushroom saved successfully")
        } catch {
            print("Error saving mushroom: \(error)")
        }
    }
}
