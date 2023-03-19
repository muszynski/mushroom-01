//
//  SavePhoto.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 19/03/2023.
//
import Foundation
import CoreData
import UIKit

func saveMushroomPhoto(_ managedObjectContext: NSManagedObjectContext, inputImage: UIImage?) {
    let mushroomPhoto = MushroomPhoto(context: managedObjectContext)
    if let inputImage = inputImage, let imageData = inputImage.jpegData(compressionQuality: 0.8) {
        mushroomPhoto.photoData = imageData
    }

    do {
        try managedObjectContext.save()
    } catch {
        print("Error saving mushroom photo: \(error)")
    }
}
