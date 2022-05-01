//
//  LoginViewModel.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 28/4/22.
//

import Foundation
import FirebaseAuth

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

final class LoginViewModel: ObservableObject {
    
    @Published var userLogged: User?
    @Published var isAuthenticated = false
    @Published var error: NSError?
    
    private let authenticationData = Auth.auth()
    
    required init() {
        userLogged = authenticationData.currentUser
        authenticationData.addStateDidChangeListener(stateAuthModified)
    }
    
    private func stateAuthModified(with auth: Auth, user: User?) {
        guard user != self.userLogged else { return }
        self.userLogged = user
    }
    
    //SignIn
    func signIn(with loginOption: LoginOption) {
        self.isAuthenticated = true
        self.error = nil
        switch loginOption {
        case .sessionWithApple:
            print("login con Apple")
        case .emailAndPassword(let email, let password):
            authenticationData.signIn(withEmail: email,
                                      password: password,
                                      completion: handlerAuthState)
        }
    }
    
    //SignUp
    func signUp(email: String, password: String, passwordConfirmation: String) {
        guard password == passwordConfirmation else {
            self.error = NSError(domain: "", code: 9210, userInfo: [NSLocalizedDescriptionKey : "La password y la confirmación no son iguales"])
            return
        }
        self.isAuthenticated = true
        self.error = nil
        authenticationData.createUser(withEmail: email, password: password, completion: handlerAuthState)
    }
    
    //Logout
    func logoutSession() {
        do {
            try authenticationData.signOut()
        } catch {
            self.error = NSError(domain: "", code: 9999, userInfo: [NSLocalizedDescriptionKey : "El usuario no ha logrado cerrar la sesión"])
        }
    }
    
    //Handler
    private func handlerAuthState(with auth: AuthDataResult?, and error: Error?) {
        DispatchQueue.main.async {
            self.isAuthenticated = false
            if let user = auth?.user {
                self.userLogged = user
            } else if let errorUnw = error {
                self.error = errorUnw as NSError
            }
        }
    }
}

