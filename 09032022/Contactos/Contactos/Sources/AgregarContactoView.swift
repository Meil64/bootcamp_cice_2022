//
//  AgregarContactoView.swift
//  Contactos
//
//  Created by Carlos Carrera on 14/5/22.
//

import SwiftUI

struct AgregarContactoView: View {
    
    //MARK: ICD
    @Environment(\.managedObjectContext) private var viewContext
    @SwiftUI.Environment(\.presentationMode) var presentedMode
    
    @State private var apellido = ""
    @State private var direccion = ""
    @State private var edad = ""
    @State private var email = ""
    @State private var genero = ""
    @State private var nombre = ""
    @State private var telefono = ""
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                TextField("Apellido", text: self.$apellido)
                    .textFieldStyle()
                TextField("Dirección", text: self.$direccion)
                    .textFieldStyle()
                TextField("Edad", text: self.$edad)
                    .textFieldStyle()
                    .keyboardType(.phonePad)
                TextField("Email", text: self.$email)
                    .textFieldStyle()
                    .keyboardType(.emailAddress)
                TextField("Género", text: self.$genero)
                    .textFieldStyle()
                TextField("Nombre", text: self.$nombre)
                    .textFieldStyle()
                TextField("Teléfono", text: self.$telefono)
                    .textFieldStyle()
                    .keyboardType(.phonePad)
                
                Button {
                    self.salvarContacto()
                } label: {
                    HStack(spacing: 20) {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(.white)
                            .font(.title)
                        Text("Guardar contacto")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                }
            }
            .padding(10)
        }
        .navigationTitle("Agregar Contacto")
    }
    
    //MARK: Private methods
    private func salvarContacto() {
        //Accedemos a la entidad que contiene la BBDD
        let nuevoContacto = Contacto(context: self.viewContext)
        let inicialN = String(self.nombre.first ?? " ")
        let inicialA = String(self.nombre.first ?? " ")
        
        nuevoContacto.apellido = self.apellido
        nuevoContacto.direccion = self.direccion
        nuevoContacto.edad = self.edad
        nuevoContacto.email = self.email
        nuevoContacto.genero = self.genero
        nuevoContacto.iniciales = inicialN + inicialA
        nuevoContacto.nombre = self.nombre
        nuevoContacto.telefono = self.telefono
        
        do {
            try self.viewContext.save()
            print("salvado correctamente")
            self.presentedMode.wrappedValue.dismiss()
        } catch let error as NSError {
            print("Error al salvar los datos", error.localizedDescription)
        }
    }
}

struct AgregarContactoView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarContactoView()
    }
}
