//
//  ContentView.swift
//  Contactos
//
//  Created by Carlos Carrera on 14/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(fetchRequest: Contacto.mostrarContactos()) var contactos: FetchedResults<Contacto>
    
    var body: some View {
        NavigationView{
            
            VStack{
                List(self.contactos){ contacto in
                    ContactosCell(contacto: contacto)
                }
                
                NavigationLink(destination: AgregarContactoView()) {
                    HStack(spacing: 20) {
                        Image(systemName: "plus.app.fill")
                            .foregroundColor(.white)
                            .font(.title)
                        Text("Guardar contacto")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                    .background(.green)
                    .clipShape(Capsule())
                }
            }
            .navigationTitle("Contactos")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
