//
//  HomeTabBarViewCoordinator.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 20/2/22.
//

import UIKit

final class HomeTabBarViewCoordinator {
    
    static func homeViewController() -> UITabBarController {
        let homeVC = HomeTabBarController()
        
        //Controladores
        let contactosVC = ContactosViewCoordinator.navigation()
        let nuevaTareaVC = NuevaTareaViewCoordinator.navigation()
        let listaTareasVC = ListaTareasViewCoordinator.navigation()
        
        //Iconos
        let iconContacto = UITabBarItem(title: "Mis contactos",
                                        image: UIImage(systemName: "person.crop.circle"),
                                        selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        
        let iconNuevaTarea = UITabBarItem(title: "Nueva tarea",
                                        image: UIImage(systemName: "pencil.and.outline"),
                                        selectedImage: UIImage(systemName: "pencil.and.outline"))
        
        let listaTareas = UITabBarItem(title: "Lista tareas",
                                        image: UIImage(systemName: "text.redaction"),
                                        selectedImage: UIImage(systemName: "text.redaction"))
        
        //Asignamos iconos
        contactosVC.tabBarItem = iconContacto
        nuevaTareaVC.tabBarItem = iconNuevaTarea
        listaTareasVC.tabBarItem = listaTareas
        
        //Asignamos controladores
        homeVC.viewControllers = [contactosVC, nuevaTareaVC, listaTareasVC]
        
        return homeVC
    }
}
