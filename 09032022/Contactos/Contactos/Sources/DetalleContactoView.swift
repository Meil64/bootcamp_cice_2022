//
//  DetalleContactoView.swift
//  Contactos
//
//  Created by Carlos Carrera on 15/5/22.
//

import SwiftUI

struct DetalleContactoView: View {
    
    @SwiftUI.Environment(\.presentationMode) var presentedMode //Para que refresque la vista tras editar
    var data: Contacto
    
    var body: some View {
        VStack{
            Text(self.data.iniciales)
                .circularButton(fontSize: 100,
                                backgroundColor: .gray,
                                padding: 50)
            Text(self.data.nombre)
                .font(.title)
                .bold()
            Text(self.data.apellido)
                .font(.headline)
            Text("Tel: \(self.data.telefono)")
                .font(.largeTitle)
            
            HStack{
                Button{
                    guard let numero = URL(string: "tel://" + self.data.telefono) else { return }
                    UIApplication.shared.open(numero, options: [:], completionHandler: nil)
                } label: {
                    Image(systemName: "phone.fill")
                        .circularButton(fontSize: 30,
                                        backgroundColor: .green,
                                        padding: 30)
                }
                
                NavigationLink{
                    AgregarContactoView(esEdicion: true, data: self.data)
                } label: {
                    Image(systemName: "pencil")
                        .circularButton(fontSize: 30,
                                        backgroundColor: .blue,
                                        padding: 30)
                }
            }
        }
    }
}

struct DetalleContactoView_Previews: PreviewProvider {
    static var previews: some View {
        DetalleContactoView(data: Contacto())
    }
}
