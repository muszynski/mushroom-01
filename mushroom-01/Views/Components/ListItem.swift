//
//  ListItem.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 16/03/2023.
//

import SwiftUI
import MapKit
import CoreData

struct ListItem: View {
    @Environment(\.managedObjectContext) private var viewContext
    var mushroomData: MushroomData

    @State private var showDetail = false

    var body: some View {
        Button(action: {
            showDetail.toggle()
        }) {
            HStack {
                // Miniatura zdjęcia
                if let data = mushroomData.imageData, let image = UIImage(data: data) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .cornerRadius(5)
                } else {
                    Image("mushroom")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .cornerRadius(5)
                }

                // Tekst w dwóch liniach
                VStack(alignment: .leading) {
                    Text(mushroomData.typeMushroom ?? "Gatunek grzyba")
                        .font(.headline)
                    Text(mushroomData.forrestType ?? "Rodzaj lasu")
                        .font(.subheadline)
                    Text("\(mushroomData.lat )")
                        .font(.caption)
                    Text("\(mushroomData.long )")
                        .font(.caption)
                }
                .padding(.leading)

                Spacer()

                // Przycisk ulubionych
                VStack {
                    Button(action: {
                        withAnimation {
                            mushroomData.isFavorite.toggle()
                            saveContext()
                        }
                    }) {
                        Image(systemName: mushroomData.isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(mushroomData.isFavorite ? .red : .gray)
                            .font(.title2)
                    }

                    Text(formatDate(date: mushroomData.creationDate))
                        .font(.caption2)
                }

            }
            .padding()
            .background(Color.white.opacity(0.85))
            .cornerRadius(5)
            .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
        }


    }

    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(mushroomData: MushroomData(context: NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)))
    }
}

