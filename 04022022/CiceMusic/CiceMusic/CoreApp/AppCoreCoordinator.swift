//
//  AppCoreCoordinator.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 2/3/22.
//

import Foundation
import UIKit

protocol AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow)
    func createSlidingMenu(window: UIWindow, vc: UIViewController)
}

final class AppCoreCoordinator {
    var actualVC = UIViewController()
}

extension AppCoreCoordinator: AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow) {
        self.actualVC = SplashCoordinator.view()
        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
    
    func createSlidingMenu(window: UIWindow, vc: UIViewController) {
        let frontViewController = vc
        let rearViewController = UIViewController()
        let swRevealVC = SWRevealViewController(rearViewController: rearViewController, frontViewController: frontViewController)
        swRevealVC?.toggleAnimationType = SWRevealToggleAnimationType.easeOut
        swRevealVC?.toggleAnimationDuration = 0.3
        window.rootViewController = swRevealVC
        window.makeKeyAndVisible()
    }
}
