//
//  ContentView.swift
//  Ant Design Demo
//
//  Created by François Boulais on 04/07/2022.
//

import AntDesign
import SwiftUI

struct ContentView: View {
    @State private var favoriteColor = 0
    
    var body: some View {
        NavigationView {
            Form {
                NavigationLink("Button") {
                    ButtonDemoView()
                }
                NavigationLink("Switch") {
                    SwitchDemoView()
                }
            }
            .navigationTitle("Components")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
