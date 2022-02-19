//
//  AppCoreCoordinator.swift
//  MiUserDefault
//
//  Created by Carlos Carrera on 18/2/22.
//

import Foundation
import UIKit

protocol AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow)
}

final class AppCoreCoordinator {
    var actualVC = UIViewController()
}

extension AppCoreCoordinator: AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow) {
        
        self.muestraRutaUserDefault()
        
        if Utils.Constants().kPrefs.bool(forKey: Utils.Constants().kUserLogado) {
            self.actualVC = HomeViewCoordinator.homeView()
        } else {
            self.actualVC = RegistroCoordinator.view()
        }
        
        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
    
    private func muestraRutaUserDefault() {
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
    }
    
}
