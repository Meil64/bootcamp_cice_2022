//
//  ContactosApp.swift
//  Contactos
//
//  Created by Carlos Carrera on 14/5/22.
//

import SwiftUI

@main
struct ContactosApp: App {
    
    let persistanceVM = PersistanceViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistanceVM.container.viewContext)
        }
    }
}
