//
//  ContentView.swift
//  ColorView
//
//  Created by Кирилл on 14.09.2023.
//

import SwiftUI

enum ColorField: Hashable, CaseIterable {
    case red
    case green
    case blue
}

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255).rounded()
    @State private var greenSliderValue = Double.random(in: 0...255).rounded()
    @State private var blueSliderValue = Double.random(in: 0...255).rounded()
    
    @FocusState private var focusTextField: ColorField?
    @FocusState private var focusKeyboard: Bool
    
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 200)
                .foregroundColor(
                    Color(
                        red: redSliderValue / 255,
                        green: greenSliderValue / 255,
                        blue: blueSliderValue / 255
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 5)
                )
                .padding()
            
            VStack {
                
                SliderView(
                    value: $redSliderValue,
                    colorLineSlider: .red
                )
                .focused($focusTextField, equals: .red)
                .onSubmit {
                    focusTextField = nil
                }
                
                SliderView(
                    value: $greenSliderValue,
                    colorLineSlider: .green
                )
                .focused($focusTextField, equals: .green)
                .onSubmit {
                    focusTextField = nil
                }
                SliderView(
                    value: $blueSliderValue,
                    colorLineSlider: .blue
                )
                .focused($focusTextField, equals: .blue)
                .onSubmit {
                    focusTextField = nil
                }
            }
            .padding()
            .focused($focusKeyboard)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("↑") {
                        if focusTextField == .blue {
                            focusTextField = .green
                        } else if focusTextField == .green {
                            focusTextField = .red
                        }
                    }
                    Button("↓") {
                        if focusTextField == .red {
                            focusTextField = .green
                        } else if focusTextField == .green {
                            focusTextField = .blue
                        }
                    }
                    Spacer()
                    
                    Button("Done") {
                        focusKeyboard = false
                    }
                }
            }
            Spacer()
        }
        .background(Color.purple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

