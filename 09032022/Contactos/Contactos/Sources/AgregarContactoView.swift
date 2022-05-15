//
//  AgregarContactoView.swift
//  Contactos
//
//  Created by Carlos Carrera on 14/5/22.
//

import SwiftUI
import UserNotifications

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
    
    var esEdicion = false
    var data: Contacto?
    
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
                        Image(systemName: esEdicion ? "pencil" : "person.crop.circle")
                            .foregroundColor(.white)
                            .font(.title)
                        Text(esEdicion ? "Editar contacto" : "Guardar contacto")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                }
            }
            .onAppear(perform: {
                if esEdicion {
                    self.nombre = data?.nombre ?? ""
                    self.apellido = data?.apellido ?? ""
                    self.direccion = data?.direccion ?? ""
                    self.email = data?.email ?? ""
                    self.telefono = data?.telefono ?? ""
                    self.genero = data?.genero ?? ""
                    self.edad = data?.edad ?? ""
                }
            })
            .padding(10)
        }
        .navigationTitle(esEdicion ? "Editar Contacto" : "Agregar Contacto")
    }
    
    //MARK: Private methods
    private func salvarContacto() {
        
        let inicialN = String(self.nombre.first ?? " ")
        let inicialA = String(self.nombre.first ?? " ")
        
        if self.esEdicion{
            
            self.data?.nombre = self.nombre
            self.data?.apellido = self.apellido
            self.data?.direccion = self.direccion
            self.data?.edad = self.edad
            self.data?.email = self.email
            self.data?.genero = self.genero
            self.data?.iniciales = inicialN + inicialA
            self.data?.telefono = self.telefono
            
        } else {
            
            //Accedemos a la entidad que contiene la BBDD
            let nuevoContacto = Contacto(context: self.viewContext)
            
            nuevoContacto.apellido = self.apellido
            nuevoContacto.direccion = self.direccion
            nuevoContacto.edad = self.edad
            nuevoContacto.email = self.email
            nuevoContacto.genero = self.genero
            nuevoContacto.iniciales = inicialN + inicialA
            nuevoContacto.nombre = self.nombre
            nuevoContacto.telefono = self.telefono
        }
        
        do {
            try self.viewContext.save()
            print("salvado correctamente")
            self.presentedMode.wrappedValue.dismiss()
            
            if !self.esEdicion {
                self.localNotification()
            }
            
        } catch let error as NSError {
            print("Error al salvar los datos", error.localizedDescription)
        }
    }
    
    private func localNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in
            
        }
        
        //Contenido
        let contenido = UNMutableNotificationContent()
        contenido.title = "Mi notificación"
        contenido.subtitle = "Mi subtítulo de notificación"
        contenido.body = "Esta es mi primera notificación"
        contenido.sound = .defaultCritical
        contenido.badge = 1
        
        //Imagen
        if let path = Bundle.main.path(forResource: "notiimage", ofType: "jpg") {
            let url = URL(fileURLWithPath: path)
            do {
                let image = try UNNotificationAttachment(identifier: "notiimage", url: url, options: nil)
                contenido.attachments = [image]
            } catch {
                print("No carga la imagen")
            }
        }
        
        //Botones
        let boton1 = UNNotificationAction(identifier: "boton1", title: "Abrir la vista detalle", options: .foreground)
        let cancel = UNNotificationAction(identifier: "cancelar", title: "Cancelar", options: .destructive)
        
        let categoria = UNNotificationCategory(identifier: "acciones", actions: [boton1, cancel], intentIdentifiers: [])
        UNUserNotificationCenter.current().setNotificationCategories([categoria])
        contenido.categoryIdentifier = "acciones"
        
        //Disparador
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "noti", content: contenido, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

struct AgregarContactoView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarContactoView()
    }
}
