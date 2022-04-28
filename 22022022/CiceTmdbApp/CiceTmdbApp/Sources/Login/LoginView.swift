//
//  LoginView.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 28/4/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var authType: AuthenticationType
    
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var showPassword = false
    
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                helloApp
                imageAppLogo
                
                //Haremos una comprobación para saber si el usuario está autenticado en Firebase
                if true{
                    VStack(spacing: 20) {
                        CustomTextField(placeholder: "Email",
                                        title: "Email",
                                        text: self.$email)
                            .padding(10)
                            .background(
                                Color(red: 239/255,
                                      green: 243/255,
                                      blue: 244/255,
                                      opacity: 1)
                            )
                            .cornerRadius(10)
                            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 5, y: 5)
                        
                        CustomSecureTextField(placeholder: "Password",
                                              title: "Password",
                                              text: self.$password,
                                              showPassword: self.showPassword)
                            .padding(10)
                            .background(
                                Color(red: 239/255,
                                      green: 243/255,
                                      blue: 244/255,
                                      opacity: 1)
                            )
                            .cornerRadius(10)
                            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 5, y: 5)
                        
                        if authType == .signUp {
                            CustomSecureTextField(placeholder: "Confirm Password",
                                                  title: "Confirm Password",
                                                  text: self.$confirmPassword,
                                                  showPassword: self.showPassword)
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
                            
                        Toggle("show password", isOn: self.$showPassword)
                            .padding()
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        //Botón de Login / Registro
                        Button{
                            self.authEmailTouched()
                        } label: {
                            Text(self.authType.text)
                                .font(.headline)
                                .lineLimit(2)
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
                                .background(
                                    Color(red: 239/255, green: 243/255, blue: 244/255)
                                )
                                .clipShape(Capsule())
                        }
                        .foregroundColor(.gray)
                        .padding()
                        
                        //Botón de Cambio de formulario si no estoy logado
                        Button{
                            self.footerTouched()
                        } label: {
                            Text(self.authType.footerText)
                                .font(.headline)
                                .lineLimit(2)
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
                                .background(
                                    Color(red: 239/255, green: 243/255, blue: 244/255)
                                )
                                .clipShape(Capsule())
                        }
                        .foregroundColor(.gray)
                        .padding()
                        
                    }
                }
            }
            .padding()
        }
    }
    
    var helloApp: some View{
        Text("Cice TMDB App")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 10)
            .foregroundColor(.gray)
    }
    
    var imageAppLogo: some View {
        Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.horizontal, 20)
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
            .overlay(
            Circle()
                .stroke(Color.red, lineWidth: 2))
    }
    
    private func authEmailTouched() {
        
    }
    
    private func footerTouched() {
        self.authType = authType == .signUp ? .signIn : .signUp
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authType: .signIn)
    }
}
