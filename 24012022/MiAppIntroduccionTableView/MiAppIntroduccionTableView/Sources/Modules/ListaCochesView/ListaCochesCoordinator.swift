//
//  ListaCochesCoordinator.swift
//  MiAppIntroduccionTableView
//
//  Created by Carlos Carrera on 16/2/22.
//

import Foundation
import UIKit

final class ListaCochesCoordinator {
    
    static func navigation() -> UINavigationController{
        let navVC = UINavigationController(rootViewController: self.view())
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = ListaCochesViewController()
        return vc
    }
    
}
