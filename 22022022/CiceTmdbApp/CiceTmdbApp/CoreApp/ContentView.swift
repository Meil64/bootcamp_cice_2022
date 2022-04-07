//
//  ContentView.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 4/4/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            MoviesCoordinator.navigation()
                .environment(\.colorScheme, .dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
