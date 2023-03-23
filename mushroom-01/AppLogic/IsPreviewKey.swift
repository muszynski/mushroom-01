//
//  IsPreviewKey.swift
//  mushroom-01
//
//  Created by Łukasz Muszyński on 22/03/2023.
//

import Foundation
import SwiftUI

private struct IsPreviewKey: EnvironmentKey {
    static let defaultValue = false
}

extension EnvironmentValues {
    var isPreview: Bool {
        get { self[IsPreviewKey.self] }
        set { self[IsPreviewKey.self] = newValue }
    }
}
