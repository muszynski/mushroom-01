//
//  MapViewMushroom.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 23/03/2023.
//

import SwiftUI
import CoreData
import MapKit

struct MapViewMushroom: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: MushroomData.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \MushroomData.creationDate, ascending: false)]) private var mushroomDataList: FetchedResults<MushroomData>

    var body: some View {
        VStack {
            ForEach(mushroomDataList, id: \.self) { mushroomData in
                Text(mushroomData.typeMushroom ?? "Gatunek grzyba")
                Text("\(mushroomData.long )")
                Text("\(mushroomData.lat )")
            }
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


