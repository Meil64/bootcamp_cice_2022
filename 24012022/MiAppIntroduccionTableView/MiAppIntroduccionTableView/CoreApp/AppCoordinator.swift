//
//  AppCoordinator.swift
//  MiAppIntroduccionTableView
//
//  Created by Carlos Carrera on 16/2/22.
//

import UIKit

protocol AppCoordinatorProtocol {
    func setPrincipalViewController(window: UIWindow)
}


final class AppCoordinator {
    var actualViewController: UIViewController?
}

extension AppCoordinator: AppCoordinatorProtocol{
    func setPrincipalViewController(window: UIWindow) {
        self.actualViewController = HomeTabBarCoordinator.tabBarController()
        window.rootViewController = self.actualViewController
        window.makeKeyAndVisible()
    }    
}
