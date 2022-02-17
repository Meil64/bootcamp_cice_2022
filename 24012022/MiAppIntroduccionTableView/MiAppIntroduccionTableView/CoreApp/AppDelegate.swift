//
//  AppDelegate.swift
//  MiAppIntroduccionTableView
//
//  Created by Carlos Carrera on 16/2/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window : UIWindow?
    let appCoordiantor: AppCoordinatorProtocol = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let windowUnw = self.window {
            appCoordiantor.setPrincipalViewController(window: windowUnw)
        }
        return true
    }
}

