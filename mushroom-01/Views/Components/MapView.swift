//
//  MapView.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 18/03/2023.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        view.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        view.addAnnotation(annotation)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self, latitude: coordinate.latitude, longitude: coordinate.longitude)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        var latitude: CLLocationDegrees
        var longitude: CLLocationDegrees

        init(_ parent: MapView, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
            self.parent = parent
            self.latitude = latitude
            self.longitude = longitude
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "kozlarz"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)

                let kozlarzImage = UIImage(named: "kozlarz")
                let newSize = CGSize(width: 40, height: 40)
                let renderer = UIGraphicsImageRenderer(size: newSize)
                let resizedImage = renderer.image { _ in
                    kozlarzImage?.draw(in: CGRect(origin: .zero, size: newSize))
                }

                annotationView?.image = resizedImage
                annotationView?.canShowCallout = true

                let detailLabel = UILabel()
                detailLabel.numberOfLines = 2
                detailLabel.text = "Lat: \(latitude)\nLng: \(longitude)"
                annotationView?.detailCalloutAccessoryView = detailLabel

            } else {
                annotationView?.annotation = annotation
            }

            return annotationView
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: .constant(CLLocationCoordinate2D(latitude: 52.2980744, longitude: 20.8984804)))
    }
}

