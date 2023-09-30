//
//  TextFieldView.swift
//  ColorView
//
//  Created by Кирилл on 23.09.2023.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var text: String
    
    let action: () -> Void
    
    var body: some View {
        
        TextField("255", text: $text) { _ in
            withAnimation {
                action()
            }
        }
        .frame(width: 50)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .keyboardType(.numberPad)
        .padding(.leading, 5)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            TextFieldView(text: .constant("255"), action: {})
        }
    }
}
