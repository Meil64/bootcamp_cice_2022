//
//  CustomTextField.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 28/4/22.
//

import SwiftUI

struct CustomTextField: View {
    
    var placeholder: String
    var title: String
    var text: Binding<String>
    //@Binding var text: String //lo mismo que var text: Binding<String>
    
    var body: some View {
        HStack{
            Image(systemName: "person")
            ZStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.gray)
                    .offset(y: text.wrappedValue.isEmpty ? 0 : -25)
                    .scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.8, anchor: .leading)
                TextField(placeholder, text: text)
                    .foregroundColor(.black)
            }
            .padding(.top, 15)
            .animation(.spring(response: 0.2,
                               dampingFraction: 0.5,
                               blendDuration: 0.3),
                       value: text.wrappedValue.isEmpty)
        }
    }
}

struct CustomSecureTextField: View {
    var placeholder: String
    var title: String
    var text: Binding<String>
    var showPassword: Bool
    
    var body: some View {
        HStack{
            Image(systemName: "lock")
            ZStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.gray)
                    .offset(y: text.wrappedValue.isEmpty ? 0 : -25)
                    .scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.8, anchor: .leading)
                if showPassword {
                    TextField(placeholder, text: text)
                        .foregroundColor(.black)
                } else {
                    SecureField(placeholder, text: text)
                        .foregroundColor(.black)
                }                
            }
            .padding(.top, 15)
            .animation(.spring(response: 0.2,
                               dampingFraction: 0.5,
                               blendDuration: 0.3),
                       value: text.wrappedValue.isEmpty)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureTextField(placeholder: "email",
                        title: "email",
                        text: .constant("email@email.com"),
                        showPassword: false)
    }
}
