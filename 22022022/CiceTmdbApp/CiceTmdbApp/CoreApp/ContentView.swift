//
//  ContentView.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 4/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack{
            
            if currentPage > Constants.totalPages {
                //HomeView()
                LoginView(authType: .signIn)
            } else {
                OnboardingView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
