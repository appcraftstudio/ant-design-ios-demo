//
//  IconPickerView.swift
//  Ant Design Demo
//
//  Created by François Boulais on 04/07/2022.
//

import AntDesign
import SwiftUI

struct IconPickerView: View {
    @Binding var selectedIcon: Icon
    @Environment(\.dismiss) private var dismiss
    @State private var term: String = ""
    
    private var icons: [Icon] {
        let outlined: [Icon] = Icon.Outlined.allCases.map { .outlined($0) }
        let filled: [Icon] = Icon.Filled.allCases.map { .filled($0) }
        let twotones: [Icon] = Icon.Twotone.allCases.map { .twotone($0) }
        
        return (outlined + filled + twotones)
            .filter { icon in
                if term.isEmpty {
                    return true
                } else {
                    return icon.name.lowercased().contains(term.lowercased())
                }
            }
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            List(icons, id: \.self) { icon in
                Button {
                    selectedIcon = icon
                } label: {
                    HStack {
                        Label(icon.name, icon: icon)
                            .frame(height: 24)
                            .foregroundColor(.primary)
                        
                        if icon == selectedIcon {
                            Spacer()
                            Image(systemName: "checkmark")
                                .foregroundColor(.accentColor)
                        }
                    }
                }
            }
            .onAppear {
                withAnimation {
                    proxy.scrollTo(selectedIcon, anchor: .center)
                }
            }
        }
        .onChange(of: selectedIcon) { newValue in
            dismiss()
        }
        .listStyle(.plain)
        .navigationTitle("Icon")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $term, prompt: "Search icons here")
        .animation(.default, value: icons)
    }
}
