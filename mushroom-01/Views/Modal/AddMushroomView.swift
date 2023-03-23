//
//  AddMushroomView.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 18/03/2023.
//

import SwiftUI
import CoreData
import UIKit

struct AddMushroomView: View {
    // Dodaj tę zmienną na początku struktury AddMushroomView
    @Environment(\.isPreview) private var isPreview
    @StateObject var locationManager = LocationManager()
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedMushroom = 0
    @State private var mushroomSize = 1
    @State private var isFavorite = false
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var lat : Double = 0.0
    @State private var long : Double = 0.0
    @State private var showingPhotoLibraryPicker = false
    @State private var showingCameraPicker = false
    
    let mushrooms = ["Muchomor", "Borowik"]
    
    private func addMushroom(completion: @escaping () -> Void) {
        let mushroomManager = MushroomManager()
        mushroomManager.saveMushroom(managedObjectContext: managedObjectContext,
                                     inputImage: inputImage,
                                     name: mushrooms[selectedMushroom],
                                     size: mushroomSize,
                                     isFavorite: isFavorite,
                                     long: long,
                                     lat: lat
        )
        completion()
    }
    
    private func getLocation(completion: @escaping () -> Void) {
        if let userLocation = locationManager.userLocation {
            lat = userLocation.coordinate.latitude
            long = userLocation.coordinate.longitude
            let locationText = "Latitude: \(lat), Longitude: \(long)"
            print("User's location: \(locationText)")
            completion()
        } else {
            print("Unknown location")
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
                }
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
                

                
                Section (header: Text("Dodaj zdjęcie")){
                    Button(action: {
                        showingPhotoLibraryPicker = true
                    }) {
                        Text("Dodaj zdjęcie z biblioteki")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        if UIImagePickerController.isSourceTypeAvailable(.camera) {
                            showingCameraPicker = true
                        } else {
                            print("Camera not available")
                        }
                    }) {
                        Text("Zrób zdjęcie")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                Section (header: Text("Utwórz")){
                    Button(action: {
                            getLocation {
                                addMushroom {
                                    if !isPreview {
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                }
                            }
                        }) {
                        Text("Dodaj znalezisko")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
//                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Anuluj")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                }
            }
            .sheet(isPresented: $showingPhotoLibraryPicker) {
                AddPhotoView(image: $inputImage, sourceType: .photoLibrary).edgesIgnoringSafeArea(.bottom)
            }
            .sheet(isPresented: $showingCameraPicker) {
                AddPhotoView(image: $inputImage, sourceType: .camera).edgesIgnoringSafeArea(.bottom)
            }
        }                .navigationBarTitle("Dodaj grzyba", displayMode: .inline)
        
    }
}

struct AddMushroomView_Previews: PreviewProvider {
    static var previews: some View {
        AddMushroomView().environment(\.isPreview, true)
    }
}
