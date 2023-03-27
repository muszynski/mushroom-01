//
//  Charts.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 24/03/2023.
//

import SwiftUI
import Charts


struct Charts: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: MushroomData.entity(), sortDescriptors: []) var mushrooms: FetchedResults<MushroomData>
    @FetchRequest(entity: MushroomData.entity(), sortDescriptors: [], predicate: NSPredicate(format: "typeMushroom CONTAINS[cd] 'Muchomor'")) var muchomorMushrooms: FetchedResults<MushroomData>
    @FetchRequest(entity: MushroomData.entity(), sortDescriptors: [], predicate: NSPredicate(format: "typeMushroom CONTAINS[cd] 'Borowik'")) var borowikMushrooms: FetchedResults<MushroomData>
    
    var body: some View {
        VStack {
            Text("Ilość grzybów")
                .font(.headline)
        
        }
    }
}

struct Charts_Previews: PreviewProvider {
    static var previews: some View {
        Charts()
    }
}
