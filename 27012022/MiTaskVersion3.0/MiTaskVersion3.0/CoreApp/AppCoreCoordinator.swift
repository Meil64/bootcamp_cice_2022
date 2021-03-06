//
//  AppCoreCoordinator.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 20/2/22.
//

import UIKit

protocol AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow)
}

final class AppCoreCoordinator {
    var actualVC = UIViewController()
}

extension AppCoreCoordinator: AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow) {
        
        if UserDefaultsHelper.isUsuarioLogado() {
            self.actualVC = HomeTabBarViewCoordinator.homeViewController()
        } else {
            self.actualVC = LoginViewCoordinator.view()
        }
        
        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
}
