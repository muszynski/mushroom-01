//
//  Stats.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 23/03/2023.
//

import SwiftUI
import CoreData

struct Stats: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: MushroomData.entity(), sortDescriptors: []) var mushrooms: FetchedResults<MushroomData>
    
    @FetchRequest(entity: MushroomData.entity(), sortDescriptors: [], predicate: NSPredicate(format: "typeMushroom CONTAINS[cd] 'Muchomor'")) var muchomorMushrooms: FetchedResults<MushroomData>
    
    @FetchRequest(entity: MushroomData.entity(), sortDescriptors: [], predicate: NSPredicate(format: "typeMushroom CONTAINS[cd] 'Borowik'")) var borowikMushrooms: FetchedResults<MushroomData>
    
    var body: some View {
        HStack {
            VStack{
                Text("\(muchomorMushrooms.count)")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 6)
                    .background(Color.green)
                    .cornerRadius(6)
                    .foregroundColor(.white)
                Text("Muchomorów")
                    .font(.caption2)
                    .multilineTextAlignment(.center)
            }
            VStack{
                Text("\(borowikMushrooms.count)")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 6)
                    .background(Color.red)
                    .cornerRadius(6)
                    .foregroundColor(.white)
                Text("Borowików")
                    .font(.caption2)
                    .multilineTextAlignment(.center)
            }
            VStack{
                Text("\(mushrooms.count)")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 6)
                    .background(Color.blue)
                    .cornerRadius(6)
                    .foregroundColor(.white)
                Text("Grzybów")
                    .font(.caption2)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        Stats()
    }
}
