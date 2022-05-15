//
//  Contactos.swift
//  Contactos
//
//  Created by Carlos Carrera on 14/5/22.
//

import Foundation
import CoreData

final class Contacto: NSManagedObject, Identifiable {
    
    @NSManaged public var apellido: String
    @NSManaged public var direccion: String
    @NSManaged public var edad: String
    @NSManaged public var email: String
    @NSManaged public var genero: String
    @NSManaged public var iniciales: String
    @NSManaged public var nombre: String
    @NSManaged public var telefono: String    
}

//Queries first option
extension Contacto {
    
    static func mostrarContactos() -> NSFetchRequest<Contacto> {
        //SQL SELECT * FROM CONTACTOS
        let request: NSFetchRequest<Contacto> = Contacto.fetchRequest() as! NSFetchRequest<Contacto>
        //SQL ORDER BY NOMBRE ASC
        request.sortDescriptors = [NSSortDescriptor(key: "nombre", ascending: true)]
        //request.predicate = 
        return request
    }
    
}
