//
//  ProgressDemoView.swift
//  Ant Design Demo
//
//  Created by François Boulais on 13/07/2022.
//

import AntDesign
import SwiftUI

struct ProgressDemoView: View {
    var body: some View {
        List {
            Group {
                ProgressBarSection()
                DynamicSection()
                CustomLineGradientSection()
                ProgressBarWithSuccessSegmentSection()
                MiniSizeProgressBarSection()
            }
            .font(.system(size: Preferences.fontSizeBase))
            .listRowBackground(Preferences.componentBackground)
            .foregroundColor(Preferences.textColor)
        }
        .navigationTitle("Progress")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    struct ProgressBarSection: View {
        var body: some View {
            Section("Progress bar") {
                VStack(alignment: .leading) {
                    ProgressView(value: 0.3)
                        .progressViewStyle(LineProgressStyle())
                    ProgressView(value: 0.5)
                        .progressViewStyle(LineProgressStyle(status: .active))
                    ProgressView(value: 0.7)
                        .progressViewStyle(LineProgressStyle(status: .exception))
                    ProgressView(value: 1.0)
                        .progressViewStyle(LineProgressStyle())
                    ProgressView(value: 0.5)
                        .progressViewStyle(LineProgressStyle(showInfo: false))
                }
                .padding(.vertical)
                
                Text("A standard progress bar.")
            }
        }
    }
    
    struct DynamicSection: View {
        @State private var progress: CGFloat = 0
        
        var body: some View {
            Section("Progress bar") {
                VStack(alignment: .leading) {
                    ProgressView(value: round(progress * 100) / 100.0)
                        .progressViewStyle(LineProgressStyle())
                    Stepper("Progress", value: $progress, in: 0...1, step: 0.1)
                        .labelsHidden()
                }
                .padding(.vertical)
                
                Text("A dynamic progress bar is better.")
            }
        }
    }
    
    struct CustomLineGradientSection: View {
        var body: some View {
            Section("Custom line gradient") {
                VStack(alignment: .leading) {
                    ProgressView(value: 0.999)
                        .progressViewStyle(LineProgressStyle(
                            strokeColor: .gradient(
                                start: .init("progress-gradient-start"),
                                end: .init("progress-gradient-end"))
                        ))
                    
                    ProgressView(value: 0.999)
                        .progressViewStyle(LineProgressStyle(
                            status: .active,
                            strokeColor: .gradient(
                                start: .init("progress-gradient-start"),
                                end: .init("progress-gradient-end"))
                        ))
                }
                .padding(.vertical)
                
                Text("A package of `linear-gradient`. It is recommended to only pass two colors.")
            }
        }
    }
    
    struct ProgressBarWithSuccessSegmentSection: View {
        var body: some View {
            Section("Progress bar with success segment") {
                VStack(alignment: .leading) {
                    ProgressView(value: 0.60)
                        .progressViewStyle(LineProgressStyle(success: .init(percent: 0.30)))
                }
                .padding(.vertical)
                
                Text("A standard progress bar. Doesn't support trail color when `type=\"circle|dashboard\"`.")
            }
        }
    }
    
    struct MiniSizeProgressBarSection: View {
        var body: some View {
            Section("Mini size progress bar") {
                VStack(alignment: .leading) {
                    ProgressView(value: 0.30)
                        .progressViewStyle(LineProgressStyle(size: .small))
                    ProgressView(value: 0.50)
                        .progressViewStyle(LineProgressStyle(size: .small, status: .active))
                    ProgressView(value: 0.70)
                        .progressViewStyle(LineProgressStyle(size: .small, status: .exception))
                    ProgressView(value: 1.00)
                        .progressViewStyle(LineProgressStyle(size: .small))
                }
                .frame(maxWidth: 170)
                .padding(.vertical)
                
                Text("Appropriate for a narrow area.")
            }
        }
    }
}
