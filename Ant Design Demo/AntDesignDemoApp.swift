//
//  AntDesignDemoApp.swift
//  Ant Design Demo
//
//  Created by François Boulais on 04/07/2022.
//

import AntDesign
import SwiftUI

@main
struct AntDesignDemoApp: App {
    init() {
        Preferences.primaryColorPalette = .cyan
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(Preferences.componentBackground)
                .prepareMessage()
        }
    }
}
