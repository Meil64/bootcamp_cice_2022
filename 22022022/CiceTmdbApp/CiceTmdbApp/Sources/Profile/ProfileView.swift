//
//  ProfileView.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 28/4/22.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModelSession: LoginViewModel
    
    var body: some View {
        if self.viewModelSession.userLogged != nil {
            Form {
                Section("Profile data") {
                    Button {
                        self.viewModelSession.logoutSession()
                    } label: {
                         Text("Logout")
                    }
                    .buttonStyleH1()
                }
            }
        } else {
            ContentView()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
