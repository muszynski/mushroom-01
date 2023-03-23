//
//  MapFunctions.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 18/03/2023.
//

import SwiftUI
import MapKit

struct MapViewFunc: UIViewRepresentable {
    @Binding var coordinate: CLLocationCoordinate2D
    var mushroomName: String

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsCompass = false
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = mushroomName
        uiView.addAnnotation(annotation)

        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        uiView.setRegion(region, animated: true)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewFunc

        init(_ parent: MapViewFunc) {
            self.parent = parent
        }
    }
}

class MKPointAnnotationWithId: MKPointAnnotation, Identifiable {
    var id = UUID()
}

