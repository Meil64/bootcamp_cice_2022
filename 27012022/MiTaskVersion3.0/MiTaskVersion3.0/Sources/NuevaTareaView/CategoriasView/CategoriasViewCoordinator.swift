//
//  CategoriasViewCoordinator.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 20/2/22.
//

import UIKit

final class CategoriasViewCoordinator {
    
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view(delegate: CategoriaViewControllerDelegate? = nil) -> UIViewController {
        let vc = CategoriasViewController()
        vc.delegate = delegate
        return vc
    }
    
}
