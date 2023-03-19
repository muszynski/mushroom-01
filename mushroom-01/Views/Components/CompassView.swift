//
//  CompassView.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 18/03/2023.
//

import SwiftUI
import MapKit

struct CompassView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKCompassButton {
        let compassButton = MKCompassButton()
        compassButton.compassVisibility = .visible
        return compassButton
    }

    func updateUIView(_ uiView: MKCompassButton, context: Context) {
    }
}

struct CompassView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView()
    }
}
