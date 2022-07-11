//
//  SwitchDemoView.swift
//  Ant Design Demo
//
//  Created by François Boulais on 06/07/2022.
//

import AntDesign
import SwiftUI

struct SwitchDemoView: View {
    var body: some View {
        List {
            Group {
                BasicSection()
                TextAndIconSection()
                LoadingSection()
                DisabledSection()
                TwoSizesSection()
            }
            .font(.system(size: Preferences.fontSizeBase))
            .listRowBackground(Preferences.componentBackground)
            .foregroundColor(Preferences.textColor)
        }
        .navigationTitle("Switch")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Sections
    
    struct BasicSection: View {
        @State private var isOn: Bool = true
        
        var body: some View {
            Section("Basic") {
                VStack(alignment: .leading) {
                    Toggle(isOn: $isOn, label: { })
                        .toggleStyle(ToggleStyle())
                        .labelsHidden()
                }
                .padding(.vertical)
                
                Text("The most basic usage.")
            }
        }
    }
    
    struct TextAndIconSection: View {
        enum Field: String {
            case text
            case number
            case icon
            
            var isOn: Bool {
                switch self {
                case .text, .icon:
                    return true
                case .number:
                    return false
                }
            }
        }
        
        @State private var states = [Field : Bool]()
        
        private func isOn(_ field: Field) -> Binding<Bool> {
            .init(
                get: { states[field, default: field.isOn] },
                set: { states[field] = $0 }
            )
        }
        
        var body: some View {
            Section("Text & icon") {
                VStack(alignment: .leading) {
                    Toggle(isOn: isOn(.text), label: { })
                        .labelsHidden()
                        .toggleStyle(ToggleStyle(
                            checkedChild: .text("开启"),
                            unCheckedChild: .text("关闭"))
                        )
                    
                    Toggle(isOn: isOn(.number), label: { })
                        .labelsHidden()
                        .toggleStyle(ToggleStyle(
                            checkedChild: .text("1"),
                            unCheckedChild: .text("0"))
                        )
                    
                    Toggle(isOn: isOn(.icon), label: { })
                        .labelsHidden()
                        .toggleStyle(ToggleStyle(
                            checkedChild: .icon(.outlined(.check)),
                            unCheckedChild: .icon(.outlined(.close)))
                        )
                }
                .padding(.vertical)
                
                Text("With text and icon.")
            }
        }
    }
    
    struct LoadingSection: View {
        enum Field: String {
            case `default`
            case small
            
            var isOn: Bool {
                switch self {
                case .default:
                    return true
                case .small:
                    return false
                }
            }
        }
        
        @State private var states = [Field : Bool]()
        
        private func isOn(_ field: Field) -> Binding<Bool> {
            .init(
                get: { states[field, default: field.isOn] },
                set: { states[field] = $0 }
            )
        }
        
        var body: some View {
            Section("Loading") {
                VStack(alignment: .leading) {
                    Toggle(isOn: isOn(.default), label: { })
                        .labelsHidden()
                        .toggleStyle(ToggleStyle(
                            isLoading: true
                        ))
                    
                    Toggle(isOn: isOn(.small), label: { })
                        .labelsHidden()
                        .toggleStyle(ToggleStyle(
                            size: .small,
                            isLoading: true
                        ))
                }
                .padding(.vertical)
                
                Text("Mark a pending state of switch.")
            }
        }
    }
    
    struct DisabledSection: View {
        @State private var isOn: Bool = true
        @State private var isEnabled: Bool = false
        
        var body: some View {
            Section("Disabled") {
                VStack(alignment: .leading) {
                    Toggle(isOn: $isOn, label: { })
                        .labelsHidden()
                        .toggleStyle(ToggleStyle())
                        .disabled(!isEnabled)
                    
                    Button {
                        isEnabled.toggle()
                    } label: {
                        Label("Toggle disabled", icon: .outlined(.clear))
                    }
                    .buttonStyle(AntDesign.ButtonStyle(
                        type: .primary,
                        layout: .titleOnly
                    ))
                }
                .padding(.vertical)
                
                Text("Disabled state of `Switch`.")
            }
        }
    }
    
    struct TwoSizesSection: View {
        enum Field: String {
            case `default`
            case small
        }
        
        @State private var states = [Field : Bool]()
        
        private func isOn(_ field: Field) -> Binding<Bool> {
            .init(
                get: { states[field, default: true] },
                set: { states[field] = $0 }
            )
        }
        
        var body: some View {
            Section("Two sizes") {
                VStack(alignment: .leading) {
                    Toggle(isOn: isOn(.default), label: { })
                        .labelsHidden()
                        .toggleStyle(ToggleStyle())
                    
                    Toggle(isOn: isOn(.small), label: { })
                        .labelsHidden()
                        .toggleStyle(ToggleStyle(
                            size: .small
                        ))
                }
                .padding(.vertical)
                
                Text("`size=\"small\"` represents a small sized switch.")
            }
        }
    }
}
