//
//  SliderView.swift
//  ColorView
//
//  Created by Кирилл on 30.09.2023.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var value: Double
    @State var valueTextField = ""
    @State private var alertPresented = false
    
    @FocusState private var isFocused: Bool
    
    var colorLineSlider: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 50)
                .foregroundColor(.white)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(colorLineSlider)
                .onChange(of: value) { newValue in
                    valueTextField = newValue.formatted()
                }
            TextFieldView(text: $valueTextField, action: checkNumber)
                .alert("Wrong Format", isPresented: $alertPresented, actions: {}) {
                    Text("Please, enter number from 0 to 255")
                }
        }
        .onAppear {
            valueTextField = value.formatted()
        }
    }
    
    private func checkNumber() {
        
        if let number = Double(valueTextField), (0...255).contains(number) {
            value = number
        } else {
            alertPresented.toggle()
            value = 1
        }
    }
}


struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(255), colorLineSlider: .black)
    }
}
