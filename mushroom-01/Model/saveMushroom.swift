//
//  saveMushroom.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 19/03/2023.
//

import Foundation
import CoreData
import UIKit
import CoreLocation

class MushroomManager {
    func getLocationName(latitude: Double, longitude: Double, completion: @escaping (String?) -> Void) {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print("Error getting location name: \(error.localizedDescription)")
                completion(nil)
            } else if let placemark = placemarks?.first {
                if let cityName = placemark.locality {
                    completion(cityName)
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    }
    
    func saveMushroom(locationManager: LocationManager, managedObjectContext: NSManagedObjectContext, inputImage: UIImage?, name: String, size: Int, isFavorite: Bool, long: Double, lat: Double, id: UUID, forrestType: String, completion: @escaping () -> Void) {
        guard let imageData = inputImage?.jpegData(compressionQuality: 1.0) else {
            print("Failed to convert inputImage to Data")
            return
        }

        getLocationName(latitude: lat, longitude: long) { cityName in
            let mushroomData = MushroomData(context: managedObjectContext)
            mushroomData.id = UUID()
            mushroomData.typeMushroom = name
            mushroomData.size = Int16(size)
            mushroomData.isFavorite = isFavorite
            mushroomData.imageData = imageData
            mushroomData.creationDate = Date()
            mushroomData.long = long
            mushroomData.lat = lat
            mushroomData.location = cityName
            mushroomData.forestType = forrestType
            mushroomData.id = UUID()
            
            do {
                try managedObjectContext.save()
                print("Mushroom saved successfully")
                completion()
            } catch {
                print("Error saving mushroom: \(error)")
            }
        }
    }
}

extension MushroomData {
    var wrappedCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
}
