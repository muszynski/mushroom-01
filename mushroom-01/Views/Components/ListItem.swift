//
//  ListItem.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 16/03/2023.
//

import SwiftUI
import MapKit

struct ListItem: View {


    @State private var imageName: String = "mushroom"
    @State private var location: String = "Stare Babice"
    @State private var typeMushroom: String = "Muchomor czerwony"
    @State private var forrestType: String = "Las liściasty"
    @State private var collectionDate: String = "18.03.2023"
    @State private var collectionTime: String = "12:22"
    @State private var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 52.2980744, longitude: 20.8984804)

    @State private var isFavorite: Bool = false
    @State private var showDetail = false

    var body: some View {
        Button(action: {
            showDetail.toggle()
        }) {
            HStack {
                // Miniatura zdjęcia
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .cornerRadius(5)

                // Tekst w dwóch liniach
                VStack(alignment: .leading) {
                    Text(typeMushroom)
                        .font(.headline)
                    Text(forrestType)
                        .font(.subheadline)
                    Text(location)
                        .font(.caption)
                }
                .padding(.leading)

                Spacer()

                // Przycisk ulubionych
                VStack {
                    Button(action: {
                        isFavorite.toggle()
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite ? .red : .gray)
                            .font(.title2)
                }
                    
                    Text(collectionDate)
                        .font(.caption2)
                    Text(collectionTime)
                        .font(.caption2)
                }
                
            }
            .padding()
            .background(Color.white.opacity(0.85))
            .cornerRadius(5)
            .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
        }
        .sheet(isPresented: $showDetail) {
            MushroomDetailView(imageName: $imageName, location: $location, typeMushroom: $typeMushroom, forrestType: $forrestType, collectionDate: $collectionDate, collectionTime: $collectionTime, coordinate: $coordinate)
        }
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem()
    }
}

