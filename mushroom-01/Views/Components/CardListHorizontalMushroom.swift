//
//  CardListHorizontalMushroom.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 14/03/2023.
//

import SwiftUI

struct CardListHorizontalMushroom: View {
    var body: some View {
        GeometryReader { geometry in
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        CardMushroom()
                        CardMushroom()
                        CardMushroom()
                        CardMushroom()
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
