//
//  HomeViewCoordinator.swift
//  MiUserDefault
//
//  Created by Carlos Carrera on 19/2/22.
//

import UIKit

final class HomeViewCoordinator {
    
    static func homeView() -> UITabBarController {
        let homeVC = HomeViewController()
        
        let listaCochesVC = ListaCochesCoordinator.navigation()
        let listaPostVC = ListaPostCoordinator.navigation()
        
        let iconCoches = UITabBarItem(title: "Coches",
                                      image: UIImage(systemName: "house"),
                                      selectedImage: UIImage(systemName: "house.fill"))
        
        let iconPost = UITabBarItem(title: "Post",
                                      image: UIImage(systemName: "house"),
                                      selectedImage: UIImage(systemName: "house.fill"))
        
        listaCochesVC.tabBarItem = iconCoches
        listaPostVC.tabBarItem = iconPost
        
        homeVC.viewControllers = [listaCochesVC, listaPostVC]
        
        return homeVC
    }
    
}
