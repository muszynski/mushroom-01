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
    
    @StateObject var locationManager = LocationManager()
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var selectedMushroom = 0
    @State private var mushroomSize = 1
    @State private var isFavorite = false
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    let mushrooms = ["Muchomor", "Borowik"]
    
    private func addMushroom() {
        let userLocation = locationManager.userLocation
        let locationText = userLocation.map { location in
            "Latitude: \(location.coordinate.latitude), Longitude: \(location.coordinate.longitude)"
        } ?? "Unknown"
        print("User's location: \(locationText)")
        
        saveMushroom(managedObjectContext: managedObjectContext, inputImage: inputImage, name: mushrooms[selectedMushroom], size: mushroomSize, isFavorite: isFavorite)
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
                
                Section(header: Text("Wielkość grzyba")) {
                    Picker("Wybierz wielkość", selection: $mushroomSize) {
                        ForEach(1...5, id: \.self) { size in
                            Text("\(size)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Button(action: {
                        sourceType = .photoLibrary
                        showingImagePicker = true
                    }) {
                        Text("Dodaj zdjęcie z biblioteki")
                            .foregroundColor(.blue)
                    }
                    
                    Button(action: {
                        if UIImagePickerController.isSourceTypeAvailable(.camera) {
                            sourceType = .camera
                            showingImagePicker = true
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
                
                HStack {
                    Button(action: {
                        addMushroom()
                    }) {
                        Text("Dodaj znalezisko")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // Cancel
                    }) {
                        Text("Anuluj")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                }
                .navigationBarTitle("Dodaj grzyba", displayMode: .inline)
            }
            .sheet(isPresented: $showingImagePicker) {
                AddPhotoView(image: $inputImage, sourceType: sourceType).edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct AddMushroomView_Previews: PreviewProvider {
    static var previews: some View {
        AddMushroomView()
    }
}
