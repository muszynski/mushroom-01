//
//  MapViewMushroom.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 23/03/2023.
//

import SwiftUI
import CoreData
import MapKit
import CoreLocation


struct MapViewMushroom: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: MushroomData.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \MushroomData.creationDate, ascending: false)]) private var mushroomDataList: FetchedResults<MushroomData>
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.23, longitude: 21.01), span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0))
    @StateObject private var locationManager = LocationManager()
    @State private var userLocation: CLLocationCoordinate2D?
    
    var annotations: [MKPointAnnotationWithId] {
        var annotations = [MKPointAnnotationWithId]()
        for mushroomData in mushroomDataList {
            if let lat = mushroomData.lat as Double?, let long = mushroomData.long as Double?{
                let annotation = MKPointAnnotationWithId()
                annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                annotations.append(annotation)
            }
        }
        return annotations
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(mushroomDataList, id: \.self) { mushroomData in
                    HStack {
                        Text("\(mushroomData.lat)")
                        Text("\(mushroomData.long)")
                    }
                }
            }
            Map(coordinateRegion: $region, annotationItems: annotations) { annotation in
                MapAnnotation(coordinate: annotation.coordinate) {
                    Image(systemName: "figure.walk")
                }
            }
            .onAppear(perform: {
                if let location = locationManager.userLocation?.coordinate {
                    userLocation = location
                    region = MKCoordinateRegion(center: userLocation!, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                }
            })
        }
    }
}

struct MapViewMushroom_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let mushroomData = MushroomData(context: context)
        mushroomData.forestType = "Forest"
        mushroomData.lat = 52.23
        mushroomData.long = 21.01
        mushroomData.creationDate = Date()
        mushroomData.id = UUID()
        mushroomData.typeMushroom = "Boletus Edulis"
        mushroomData.size = 5
        
        return MapViewMushroom().environment(\.managedObjectContext, context)
    }
}
