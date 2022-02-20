//
//  LoginViewCoordinator.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 20/2/22.
//

import UIKit

final class LoginViewCoordinator {
    
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = LoginViewController()
        return vc
    }
    
}
