//
//  List.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 13/03/2023.
//

import SwiftUI
import CoreData

struct MushroomList: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: MushroomData.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \MushroomData.creationDate, ascending: !true)]) private var mushroomDataList: FetchedResults<MushroomData>
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView {
                    VStack(spacing: 3) {
                        ForEach(mushroomDataList, id: \.self) { mushroomData in
                            ListItem(mushroomData: mushroomData)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct MushroomList_Previews: PreviewProvider {
    static var previews: some View {
        MushroomList()
    }
}
