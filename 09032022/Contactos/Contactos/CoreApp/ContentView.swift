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
    
    /*
    @FetchRequest(entity: Contacto.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Contacto.nombre, ascending: true)]) var contactos: FetchedResults<Contacto>
     */
    
    /*
    // SQL: SELECT * FROM CONTACTOS WHERE APELLIDO = 'OCAMPO' ORDER BY ASC
    @FetchRequest(entity: Contacto.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Contacto.nombre, ascending: true)],
                  predicate: NSPredicate(format: "apellido = %@", "Carrera")) var contactos: FetchedResults<Contacto>
     */
    
    var body: some View {
        NavigationView{
            
            VStack{
                List{
                    ForEach(self.contactos) { contacto in
                        NavigationLink{
                            DetalleContactoView(data: contacto)
                        } label: {
                            ContactosCell(contacto: contacto)
                        }
                    }.onDelete { index in
                        self.borrarRegistros(data: index)
                    }
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
                .onAppear {
                    debugPrint("CoreData path :: \(self.getCoreDataDBPath())")
                }
            }
            .navigationBarItems(leading: EditButton())
            .navigationTitle("Contactos")
        }
    }
    
    private func borrarRegistros(data: IndexSet) {
        guard let indexUnw = data.first else { return }
        let borrarRegistro = self.contactos[indexUnw]
        self.viewContext.delete(borrarRegistro)
        do {
            try self.viewContext.save()
        } catch let error as NSError {
            print("Error al borrar registros", error.localizedDescription)
        }
    }
    
    private func getCoreDataDBPath() {
        let path = FileManager
            .default
            .urls(for: .applicationSupportDirectory, in: .userDomainMask)
            .last?
            .absoluteString
            .replacingOccurrences(of: "file://", with: "")
            .removingPercentEncoding
        
        print ("Core Data DB Path :: \(path ?? "Not found")")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
