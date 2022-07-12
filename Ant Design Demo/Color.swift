//
//  Color.swift
//  Ant Design Demo
//
//  Created by François Boulais on 05/07/2022.
//

import SwiftUI

internal extension Color {
    enum Site: String {
        case buttonGhostWrapper = "button-ghost-wrapper"
    }

    static func site(_ site: Site) -> Self {
        .init(site.rawValue)
    }
}
