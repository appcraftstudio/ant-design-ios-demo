//
//  Ant_Design_DemoApp.swift
//  Ant Design Demo
//
//  Created by François Boulais on 04/07/2022.
//

import AntDesign
import SwiftUI

@main
struct Ant_Design_DemoApp: App {
    init() {
//        Preferences.primaryColorPalette = .volcano
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(Preferences.componentBackground)
                .prepareMessage()
        }
    }
}
