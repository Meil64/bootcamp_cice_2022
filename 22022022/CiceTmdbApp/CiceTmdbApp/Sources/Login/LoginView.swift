//
//  LoginView.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 28/4/22.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModelSession: LoginViewModel
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
                
                if !self.viewModelSession.isAuthenticated {
                    VStack(spacing: 20) {
                        CustomTextField(placeholder: "Email",
                                        title: "Email",
                                        text: self.$email)
                            .textFieldStyle()
                        
                        CustomSecureTextField(placeholder: "Password",
                                              title: "Password",
                                              text: self.$password,
                                              showPassword: self.showPassword)
                            .textFieldStyle()
                        
                        if authType == .signUp {
                            CustomSecureTextField(placeholder: "Confirm Password",
                                                  title: "Confirm Password",
                                                  text: self.$confirmPassword,
                                                  showPassword: self.showPassword)
                                .textFieldStyle()
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
                                .buttonStyleH1()
                        }
                        .foregroundColor(.gray)
                        .padding()
                        
                        //Botón de Cambio de formulario si no estoy logado
                        Button{
                            self.footerTouched()
                        } label: {
                            Text(self.authType.footerText)
                                .buttonStyleH1()
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
        switch authType {
        case .signIn:
            self.viewModelSession.signIn(with: .emailAndPassword(email: self.email, password: self.password))
        case .signUp:
            self.viewModelSession.signUp(email: self.email, password: self.password, passwordConfirmation: self.confirmPassword)
        }
    }
    
    private func footerTouched() {
        self.authType = authType == .signUp ? .signIn : .signUp
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authType: .signUp)
    }
}
