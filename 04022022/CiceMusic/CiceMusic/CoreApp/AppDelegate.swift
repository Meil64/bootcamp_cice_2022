//
//  AppDelegate.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 2/3/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appCore: AppCoreCoordinatorProtocol = AppCoreCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let windowUnw = self.window {
            self.appCore.initialViewController(window: windowUnw)
        }
        
        return true
    }
    
    //MARK: - Autorotations
    var canRotate = false    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if canRotate {
            return .all
        } else {
            return .portrait
        }
    }

}
