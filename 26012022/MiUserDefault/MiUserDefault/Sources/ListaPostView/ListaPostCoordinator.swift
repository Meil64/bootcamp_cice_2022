//
//  ListaPostCoordinator.swift
//  MiUserDefault
//
//  Created by Carlos Carrera on 19/2/22.
//

import UIKit

final class ListaPostCoordinator {
    
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = ListaPostViewController()
        return vc
    }
}
