import Foundation
import UIKit

// Input del Router
protocol LoginRouterInputProtocol {
    func showHomeTabBar(data: [MenuResponse])
    func showCustomAlert(delegate: AlertDefaultViewControllerDelegate, model: CustomAlertManager)
}

final class LoginRouter: BaseRouter<LoginViewController> {
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    let appCore: AppCoreCoordinatorProtocol = AppCoreCoordinator()
    
}

// Input del Router
extension LoginRouter: LoginRouterInputProtocol {
    func showHomeTabBar(data: [MenuResponse]){
        DispatchQueue.main.async {
            let vc = HomeTabBarCoordinator.tabBarController()
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .fullScreen
            if let windowUnw = self.delegate.window {
                self.appCore.createSlidingMenu(window: windowUnw, vc: vc, menuDto: data)
            }
        }
    }
    
    func showCustomAlert(delegate: AlertDefaultViewControllerDelegate, model: CustomAlertManager){
        DispatchQueue.main.async {
            let vc = AlertDefaultViewController()
            vc.delegate = delegate
            vc.alertManager = model
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.viewController?.present(vc, animated: true, completion: nil)
        }
    }
}
