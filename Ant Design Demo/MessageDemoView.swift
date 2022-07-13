//
//  MessageDemoView.swift
//  Ant Design Demo
//
//  Created by François Boulais on 12/07/2022.
//

import AntDesign
import SwiftUI

struct MessageDemoView: View {
    var body: some View {
        List {
            Group {
                NormalPromptSection()
                CustomizeDurationSection()
                OtherTypesOfMessageSection()
                MessageWithLoadingIndicatorSection()
                UpdateMessageContentSection()
            }
            .font(.system(size: Preferences.fontSizeBase))
            .listRowBackground(Preferences.componentBackground)
            .foregroundColor(Preferences.textColor)
        }
        .navigationTitle("Message")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    struct NormalPromptSection: View {
        @State private var isPresented: Bool = false
        
        var body: some View {
            Section("Normal prompt") {
                VStack(alignment: .leading) {
                    Button {
                        isPresented = true
                    } label: {
                        Label("Display normal message", icon: .outlined(.clear))
                    }
                    .buttonStyle(AntDesign.ButtonStyle(
                        type: .primary,
                        layout: .titleOnly
                    ))
                }
                .padding(.vertical)
                
                Text("Normal message for information.")
            }
            .message(.info, text: "This is a normal message", isPresented: $isPresented)
        }
    }
    
    struct CustomizeDurationSection: View {
        @State private var isPresented: Bool = false

        var body: some View {
            Section("Customize duration") {
                VStack(alignment: .leading) {
                    Button {
                        isPresented = true
                    } label: {
                        Label("Customized display duration", icon: .outlined(.clear))
                    }
                    .buttonStyle(AntDesign.ButtonStyle(
                        layout: .titleOnly
                    ))
                }
                .padding(.vertical)
                
                Text("Customize message display duration from default `3s` to `10s`.")
            }
            .message(.success, text: "This is a prompt message for success, and it will disappear in 10 seconds", duration: 10, isPresented: $isPresented)
        }
    }
    
    struct OtherTypesOfMessageSection: View {
        @State private var isSuccessPresented: Bool = false
        @State private var isErrorPresented: Bool = false
        @State private var isWarningPresented: Bool = false

        var body: some View {
            Section("Other types of message") {
                HStack {
                    Button {
                        isSuccessPresented = true
                    } label: {
                        Label("Success", icon: .outlined(.clear))
                    }
                    .buttonStyle(AntDesign.ButtonStyle(
                        layout: .titleOnly
                    ))
                    
                    Button {
                        isErrorPresented = true
                    } label: {
                        Label("Error", icon: .outlined(.clear))
                    }
                    .buttonStyle(AntDesign.ButtonStyle(
                        layout: .titleOnly
                    ))
                    
                    Button {
                        isWarningPresented = true
                    } label: {
                        Label("Warning", icon: .outlined(.clear))
                    }
                    .buttonStyle(AntDesign.ButtonStyle(
                        layout: .titleOnly
                    ))
                }
                .padding(.vertical)
                
                Text("Messages of success, error and warning types.")
            }
            .message(.success, text: "This is a success message", isPresented: $isSuccessPresented)
            .message(.error, text: "This is an error message", isPresented: $isErrorPresented)
            .message(.warning, text: "This is a warning message", isPresented: $isWarningPresented)
        }
    }
    
    struct MessageWithLoadingIndicatorSection: View {
        @State private var isPresented: Bool = false
        
        var body: some View {
            Section("Message with loading indicator") {
                VStack(alignment: .leading) {
                    Toggle("Display a loading indicator", isOn: $isPresented)
                        .toggleStyle(AntDesign.ToggleStyle())
                }
                .padding(.vertical)
                
                Text("Display a global loading indicator, which is dismissed by itself asynchronously.")
            }
            .message(.loading, text: "Action in progress..", duration: 10, isPresented: $isPresented)
        }
    }
    
    struct UpdateMessageContentSection: View {
        @State private var isLoadingPresented: Bool = false
        @State private var isLoadedPresented: Bool = false

        private let key = "action-identifier"
        
        var body: some View {
            Section("Update Message Content") {
                VStack(alignment: .leading) {
                    Button {
                        isLoadingPresented = true
                        
                        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                            isLoadedPresented = true
                        }
                    } label: {
                        Label("Open the message box", icon: .outlined(.clear))
                    }
                    .buttonStyle(AntDesign.ButtonStyle(
                        type: .primary,
                        layout: .titleOnly
                    ))
                }
                .padding(.vertical)
                
                Text("Update message content with unique `key`.")
            }
            .message(.loading, text: "Loading..", key: key, isPresented: $isLoadingPresented)
            .message(.success, text: "Loaded!", key: key, isPresented: $isLoadedPresented)
        }
    }
}
