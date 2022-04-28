//
//  LoginViewModel.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 28/4/22.
//

import Foundation

enum LoginOption {
    case sessionWithApple
    case emailAndPassword(email: String, password: String)
}

enum AuthenticationType: String {
    case signIn
    case signUp
    
    var text: String {
        rawValue.capitalized
    }
    
    var footerText: String {
        switch self {
        case .signIn:
            return "You aren't member yet, sign up!"
        case .signUp:
            return "Are you ready for Cice TMDB App?"
        }
    }
}
