//
//  TextFieldModifier.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 1/5/22.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(
                Color(red: 239/255,
                      green: 243/255,
                      blue: 244/255,
                      opacity: 1)
            )
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 5, y: 5)
    }
}

extension View {
    func textFieldStyle() -> some View {
        self.modifier(TextFieldModifier())
    }
}
