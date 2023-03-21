//
//  CardListHorizontalMushroom.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 14/03/2023.
//

import SwiftUI

struct CardListHorizontalMushroom: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: MushroomData.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \MushroomData.creationDate, ascending: !true)]) private var mushroomDataList: FetchedResults<MushroomData>
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(Array(mushroomDataList.prefix(10)), id: \.self) { mushroomData in
                            CardMushroom(mushroomData: mushroomData)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct CardListHorizontalMushroom_Previews: PreviewProvider {
    static var previews: some View {
        CardListHorizontalMushroom()
    }
}

