//
//  ContentView.swift
//  SlideMenuApp
//
//  Created by Carlos Carrera on 15/5/22.
//

import SwiftUI

struct ContentView: View {
    
    var navigation: some View {
        NavigationBarView(title: "Custom Navigation",
                          subtitle: "subtitle custom navigation",
                          optionSelected: nil)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            navigation
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
