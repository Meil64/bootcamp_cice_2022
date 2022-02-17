//
//  HomeTabBarCoordinator.swift
//  MiAppIntroduccionTableView
//
//  Created by Carlos Carrera on 17/2/22.
//

import UIKit

final class HomeTabBarCoordinator {
    
    static func tabBarController() -> UITabBarController {
        let tabVC = HomeTabBarViewController()
        
        //Controladores
        let listaMeses = ListaCochesCoordinator.navigation()
        let listaCoches = ListaSuperCochesCoordinator.navigation()
        let listaPerfilPost = ListaPerfilPostCoordinator.navigation()
        
        //Iconos
        let listaMesesIcon = UITabBarItem(title: Constantes.tituloListaMeses,
                                          image: UIImage(systemName: "house"),
                                          selectedImage: UIImage(systemName: "house.fill"))
        
        let listaCochesIcon = UITabBarItem(title: Constantes.tituloListaCoches,
                                           image: UIImage(systemName: "house"),
                                           selectedImage: UIImage(systemName: "house.fill"))
        
        let listaPerfilPostIcon = UITabBarItem(title: Constantes.tituloListaPerfil,
                                           image: UIImage(systemName: "person"),
                                           selectedImage: UIImage(systemName: "person.fill"))
        
        //Asignamos el icono al controlador
        listaMeses.tabBarItem = listaMesesIcon
        listaCoches.tabBarItem = listaCochesIcon
        listaPerfilPost.tabBarItem = listaPerfilPostIcon
        
        //Asignamos el array de controladores y su orden
        tabVC.viewControllers = [listaMeses, listaCoches, listaPerfilPost]
        return tabVC
    }
    
}
