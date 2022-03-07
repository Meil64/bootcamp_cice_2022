//
//  SplashRouter.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 2/3/22.
//

import Foundation

// Input del Router
protocol SplashRouterInputProtocol {
    func showHomeTabBarRouter(dataSource: [ResultMusic])
}

final class SplashRouter: BaseRouter<SplashViewController> {
    
}

// Input del Router
extension SplashRouter: SplashRouterInputProtocol {
    func showHomeTabBarRouter(dataSource: [ResultMusic]) {
        let vc = HomeTabBarCoordinator.tabBarController()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.viewController?.present(vc, animated: true, completion: nil)
    }    
    
}
