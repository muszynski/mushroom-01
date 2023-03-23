//
//  AddMushroomView.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 18/03/2023.
//

import SwiftUI
import CoreData
import UIKit
import Foundation
import CoreLocation
import MapKit

struct AddMushroomView: View {
    @StateObject var locationManager = LocationManager()
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var selectedMushroom = 0
    @State private var mushroomSize = 1
    @State private var isFavorite = false
    @State private var inputImage: UIImage?
    @State private var lat: Double = 0.0
    @State private var long: Double = 0.0
    @State private var showingPhotoLibraryPicker = false
    @State private var showingCameraPicker = false
    @State private var selectedForestTypeIndex = 0
    
    
    let mushrooms = ["Muchomor", "Borowik"]
    let forestType = ["Las liściasty", "Las iglasty", "Las mieszany" ]
    
    private func addMushroom(completion: @escaping () -> Void) {
        let mushroomManager = MushroomManager()
        mushroomManager.getLocationName(latitude: lat, longitude: long) { cityName in
            mushroomManager.saveMushroom(locationManager: locationManager,
                                         managedObjectContext: managedObjectContext,
                                         inputImage: inputImage,
                                         name: mushrooms[selectedMushroom],
                                         size: mushroomSize,
                                         isFavorite: isFavorite,
                                         long: long,
                                         lat: lat,
                                         id: UUID(),
                                         forrestType: forestType[selectedForestTypeIndex]) {
                // puste domknięcie jako completion
            }
        }
    }
    
    
    private func getLocation(completion: @escaping () -> Void) {
        if let userLocation = locationManager.userLocation {
            lat = userLocation.coordinate.latitude
            long = userLocation.coordinate.longitude
            let locationText = "Latitude: \(lat), Longitude: \(long)"
            print("User's location: \(locationText)")
            addMushroom(completion: completion) // Dodaj argument 'completion'
        } else {
            print("Nieznana lokacja")
        }
    }
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Gatunek grzyba")) {
                    Picker("Wybierz gatunek", selection: $selectedMushroom) {
                        ForEach(0 ..< mushrooms.count, id: \.self) { index in
                            Text(self.mushrooms[index])
                        }
                    }
                }
                Section(header: Text("Wielkość grzyba")) {
                    Picker("Wybierz wielkość", selection: $mushroomSize) {
                        ForEach(1...5, id: \.self) { size in
                            Text("\(size)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    //
                    
                    Section(header: Text("Typ lasu")) {
                        HStack {
                            ForEach(0..<forestType.count) { index in
                                Button(action: {
                                    selectedForestTypeIndex = index
                                }, label: {
                                    Text(forestType[index])
                                        .foregroundColor(selectedForestTypeIndex == index ? .white : .primary)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 20)
                                        .background(selectedForestTypeIndex == index ? Color.blue : Color.gray.opacity(0.2))
                                        .cornerRadius(20)
                                })
                                .buttonStyle(BorderlessButtonStyle())
                                if index < forestType.count - 1 {
                                    Spacer()
                                }
                            }
                        }
                    }
                    
                    //
                    Section {
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                isFavorite.toggle()
                            }) {
                                Image(systemName: isFavorite ? "heart.fill" : "heart")
                                    .foregroundColor(isFavorite ? .red : .gray)
                                    .font(.title2)
                            }
                            
                            Spacer()
                        }
                    }
                    Section(header: Text("Dodaj zdjęcie")) {
                        Button(action: {
                            showingPhotoLibraryPicker = true
                        }) {
                            Text("Dodaj zdjęcie z biblioteki")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 44)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .sheet(isPresented: $showingPhotoLibraryPicker) {
                            AddPhotoView(image: $inputImage, sourceType: .photoLibrary)
                        }
                        
                        Button(action: {
                            showingCameraPicker = true
                        }) {
                            Text("Zrób zdjęcie")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 44)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .sheet(isPresented: $showingCameraPicker) {
                            AddPhotoView(image: $inputImage, sourceType: .camera)
                        }
                    }
                    
                    Section(header: Text("Utwórz")) {
                        Button(action: {
                            getLocation {
                                addMushroom {
                                    // Add logic to dismiss view after adding mushroom
                                }
                            }
                        }) {
                            Text("Dodaj znalezisko")                        .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 44)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        
                        //                        Button(action: {
                        //                            // Add logic to cancel and dismiss view
                        //                        }) {
                        //                            Text("Anuluj")
                        //                                .foregroundColor(.white)
                        //                                .frame(maxWidth: .infinity, minHeight: 44)
                        //                                .background(Color.red)
                        //                                .cornerRadius(10)
                        //                        }
                    }
                }
                .navigationBarTitle("Dodaj grzyba", displayMode: .inline)
            }
        }
    }
    
    struct AddMushroomView_Previews: PreviewProvider {
        static var previews: some View {
            AddMushroomView()
        }
    }
}
