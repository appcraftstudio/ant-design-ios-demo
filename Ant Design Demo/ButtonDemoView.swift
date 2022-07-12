//
//  ButtonStyleDemoView.swift
//  Ant Design Demo
//
//  Created by François Boulais on 04/07/2022.
//

import AntDesign
import SwiftUI

struct ButtonDemoView: View {
    var body: some View {
        List {
            Group {
                TypeSection()
                SizeSection()
                LoadingSection()
                GhostButtonSection()
                BlockButtonSection()
                DisabledSection()
                DangerButtonsSection()
            }
            .font(.system(size: Preferences.fontSizeBase))
            .listRowBackground(Preferences.componentBackground)
            .foregroundColor(Preferences.textColor)
        }
        .navigationTitle("Button")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Sections
    
    struct TypeSection: View {
        var body: some View {
            Section("Type") {
                VStack(alignment: .leading) {
                    Button(action: { }) {
                        Label("Primary", icon: .outlined(.clear))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .primary,
                        layout: .titleOnly
                    ))
                    
                    Button(action: { }) {
                        Label("Default", icon: .outlined(.clear))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .default,
                        layout: .titleOnly
                    ))
                    
                    Button(action: { }) {
                        Label("Dashed", icon: .outlined(.clear))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .dashed,
                        layout: .titleOnly
                    ))
                    
                    Button(action: { }) {
                        Label("Text", icon: .outlined(.clear))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .text,
                        layout: .titleOnly
                    ))
                    
                    Button(action: { }) {
                        Label("Link", icon: .outlined(.clear))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .link,
                        layout: .titleOnly
                    ))
                }
                .padding(.vertical)
                
                Text("There are `primary` button, `default` button, `dashed` button, `text` button and `link` button in antd.")
            }
        }
    }
    
    struct SizeSection: View {
        @State var size: ComponentSize = .large

        var body: some View {
            Section("Size") {
                VStack(alignment: .leading) {
                    Picker("Size", selection: $size) {
                        ForEach(ComponentSize.allCases, id: \.self) { size in
                            Text(size.rawValue.capitalized)
                        }
                    }
                    .padding(.bottom)
                                        
                    VStack(alignment: .leading) {
                        Button(action: { }) {
                            Label("Primary", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .primary,
                            layout: .titleOnly
                        ))

                        Button(action: { }) {
                            Label("Default", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .default,
                            layout: .titleOnly
                        ))

                        Button(action: { }) {
                            Label("Dashed", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .dashed,
                            layout: .titleOnly
                        ))

                        Button(action: { }) {
                            Label("Link", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .link,
                            layout: .titleOnly
                        ))

                        HStack {
                            Button(action: { }) {
                                Label("Download", icon: .outlined(.download))
                            }
                            .buttonStyle(ButtonStyle(
                                type: .primary,
                                shape: .square,
                                layout: .iconOnly
                            ))

                            Button(action: { }) {
                                Label("Download", icon: .outlined(.download))
                            }
                            .buttonStyle(ButtonStyle(
                                type: .primary,
                                shape: .circle,
                                layout: .iconOnly
                            ))
                            
                            Button(action: { }) {
                                Label("Download", icon: .outlined(.download))
                            }
                            .buttonStyle(ButtonStyle(
                                type: .primary,
                                shape: .round,
                                layout: .iconOnly
                            ))
                        }
                        
                        Button(action: { }) {
                            Label("Download", icon: .outlined(.download))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .primary,
                            shape: .round,
                            layout: .titleAndIcon
                        ))

                        Button(action: { }) {
                            Label("Download", icon: .outlined(.download))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .primary,
                            layout: .titleAndIcon
                        ))
                    }
                }
                .componentSize(size)
                .pickerStyle(.segmented)
                .padding()
                
                Text("""
                Ant Design supports a default button size as well as a large and small size.
                If a large or small button is desired, set the `size` property to either `large` or `small` respectively. Omit the `size` property for a button with the default size.
                """)
            }
        }
    }
    
    struct LoadingSection: View {
        @State var isLoading = [ButtonLayout : Bool]()
        
        var body: some View {
            Section("Loading") {
                VStack(alignment: .leading) {
                    Button(action: { }) {
                        Label("Loading", icon: .outlined(.poweroff))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .primary,
                        layout: .titleOnly,
                        isLoading: true
                    ))
                    
                    Button(action: { }) {
                        Label("Loading", icon: .outlined(.poweroff))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .primary,
                        layout: .titleOnly,
                        isLoading: true
                    ))
                    .componentSize(.small)
                    
                    Button(action: { }) {
                        Label("Loading", icon: .outlined(.poweroff))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .primary,
                        shape: .square,
                        layout: .iconOnly,
                        isLoading: true
                    ))
                    
                    Button {
                        startLoading(for: .titleOnly)
                    } label: {
                        Label("Click me!", icon: .outlined(.poweroff))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .primary,
                        layout: .titleOnly,
                        isLoading: isLoading[.titleOnly, default: false]
                    ))
                    
                    Button {
                        startLoading(for: .titleAndIcon)
                    } label: {
                        Label("Click me!", icon: .outlined(.poweroff))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .primary,
                        layout: .titleAndIcon,
                        isLoading: isLoading[.titleAndIcon, default: false]
                    ))
                    
                    Button {
                        startLoading(for: .iconOnly)
                    } label: {
                        Label("Click me!", icon: .outlined(.poweroff))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .primary,
                        shape: .square,
                        layout: .iconOnly,
                        isLoading: isLoading[.iconOnly, default: false]
                    ))
                }
                .padding(.vertical)
                
                Text("""
                A loading indicator can be added to a button by setting the `loading` property on the `Button`.
                """)
            }
        }
        
        private func startLoading(for layout: ButtonLayout) {
            guard !isLoading[layout, default: false] else {
                return
            }
            
            isLoading[layout] = true
            
            Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
                isLoading[layout] = false
            }
        }
    }
    
    struct GhostButtonSection: View {
        var body: some View {
            Section("Ghost Button") {
                VStack(alignment: .leading) {
                    Button(action: { }) {
                        Label("Primary", icon: .outlined(.clear))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .primary,
                        layout: .titleOnly,
                        isGhost: true
                    ))
                    
                    Button(action: { }) {
                        Label("Default", icon: .outlined(.clear))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .default,
                        layout: .titleOnly,
                        isGhost: true
                    ))
                    
                    Button(action: { }) {
                        Label("Dashed", icon: .outlined(.clear))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .dashed,
                        layout: .titleOnly,
                        isGhost: true
                    ))
                    
                    Button(role: .destructive, action: { }) {
                        Label("Danger", icon: .outlined(.clear))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .primary,
                        layout: .titleOnly,
                        isGhost: true
                    ))
                }
                .padding(10)
                .background(Color.site(.buttonGhostWrapper))
                .padding(.vertical)
                
                Text("`ghost` property will make button's background transparent, it is commonly used in colored background.")
            }
        }
    }
    
    struct BlockButtonSection: View {
        var body: some View {
            Section("Block Button") {
                VStack(alignment: .leading) {
                    Button(action: { }) {
                        Label("Primary", icon: .outlined(.clear))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .primary,
                        layout: .titleOnly,
                        isBlock: true
                    ))
                    
                    Button(action: { }) {
                        Label("Default", icon: .outlined(.clear))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .default,
                        layout: .titleOnly,
                        isBlock: true
                    ))
                    
                    Button(action: { }) {
                        Label("Dashed", icon: .outlined(.clear))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .dashed,
                        layout: .titleOnly,
                        isBlock: true
                    ))
                    
                    Button(action: { }) {
                        Label("Link", icon: .outlined(.clear))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .link,
                        layout: .titleOnly,
                        isBlock: true
                    ))
                }
                .padding(.vertical)
                
                Text("`isBlock` parameter will make the button fit to its parent width.")
            }
        }
    }
    
    struct DisabledSection: View {
        var body: some View {
            Section("Disabled") {
                VStack(alignment: .leading) {
                    HStack {
                        Button(action: { }) {
                            Label("Primary", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .primary,
                            layout: .titleOnly
                        ))
                        
                        Button(action: { }) {
                            Label("Primary (disabled)", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .primary,
                            layout: .titleOnly
                        ))
                        .disabled(true)
                    }
                    
                    HStack {
                        Button(action: { }) {
                            Label("Default", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .default,
                            layout: .titleOnly
                        ))
                        
                        Button(action: { }) {
                            Label("Default (disabled)", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .default,
                            layout: .titleOnly
                        ))
                        .disabled(true)
                    }
                    
                    HStack {
                        Button(action: { }) {
                            Label("Dashed", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .dashed,
                            layout: .titleOnly
                        ))
                        
                        Button(action: { }) {
                            Label("Dashed (disabled)", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .dashed,
                            layout: .titleOnly
                        ))
                        .disabled(true)
                    }
                    
                    HStack {
                        Button(action: { }) {
                            Label("Text", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .text,
                            layout: .titleOnly
                        ))
                        
                        Button(action: { }) {
                            Label("Text (disabled)", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .text,
                            layout: .titleOnly
                        ))
                        .disabled(true)
                    }
                    
                    HStack {
                        Button(action: { }) {
                            Label("Link", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .link,
                            layout: .titleOnly
                        ))
                        
                        Button(action: { }) {
                            Label("Link (disabled)", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .link,
                            layout: .titleOnly
                        ))
                        .disabled(true)
                    }
                    
                    HStack {
                        Button(role: .destructive, action: { }) {
                            Label("Danger Default", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .default,
                            layout: .titleOnly
                        ))
                        
                        Button(role: .destructive, action: { }) {
                            Label("Danger Default (disabled)", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .default,
                            layout: .titleOnly
                        ))
                        .disabled(true)
                    }
                    
                    HStack {
                        Button(role: .destructive, action: { }) {
                            Label("Danger Text", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .text,
                            layout: .titleOnly
                        ))
                        
                        Button(role: .destructive, action: { }) {
                            Label("Danger Text (disabled)", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .text,
                            layout: .titleOnly
                        ))
                        .disabled(true)
                    }
                    
                    HStack {
                        Button(role: .destructive, action: { }) {
                            Label("Danger Link", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .link,
                            layout: .titleOnly
                        ))
                        
                        Button(role: .destructive, action: { }) {
                            Label("Danger Link (disabled)", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            type: .link,
                            layout: .titleOnly
                        ))
                        .disabled(true)
                    }
                    
                    HStack {
                        Button(action: { }) {
                            Label("Ghost", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            layout: .titleOnly,
                            isGhost: true
                        ))
                        
                        Button(action: { }) {
                            Label("Ghost (disabled)", icon: .outlined(.clear))
                        }
                        .buttonStyle(ButtonStyle(
                            layout: .titleOnly,
                            isGhost: true
                        ))
                        .disabled(true)
                    }
                    .padding(10)
                    .background(Color.site(.buttonGhostWrapper))
                }
                .padding(.vertical)
                
                Text("To mark a button as disabled, add the `disabled(_ disabled: Bool)` modifier to the `Button`.")
            }
        }
    }
    
    struct DangerButtonsSection: View {
        var body: some View {
            Section("Danger Buttons") {
                VStack(alignment: .leading) {
                    Button(role: .destructive, action: { }) {
                        Label("Primary", icon: .outlined(.clear))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .primary,
                        layout: .titleOnly
                    ))
                    
                    Button(role: .destructive, action: { }) {
                        Label("Default", icon: .outlined(.clear))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .default,
                        layout: .titleOnly
                    ))
                    
                    Button(role: .destructive, action: { }) {
                        Label("Dashed", icon: .outlined(.clear))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .dashed,
                        layout: .titleOnly
                    ))
                    
                    Button(role: .destructive, action: { }) {
                        Label("Text", icon: .outlined(.clear))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .text,
                        layout: .titleOnly
                    ))
                    
                    Button(role: .destructive, action: { }) {
                        Label("Link", icon: .outlined(.clear))
                    }
                    .buttonStyle(ButtonStyle(
                        type: .link,
                        layout: .titleOnly
                    ))
                }
                .padding(.vertical)
                
                Text("`danger` property from antd can be reproduced using `destructive` button role.")
            }
        }
    }
}
