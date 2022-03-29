import Foundation
import UIKit
import MessageUI

// Input del Router
protocol MenuRouterInputProtocol {
    func canSendMail(delegate: MFMailComposeViewControllerDelegate)
    func cantSendMail()
    func confirmWebviewNavigation(delegate: AlertDefaultViewControllerDelegate)
    func showGenericWebView()
}

final class MenuRouter: BaseRouter<MenuViewController> {
    
}

// Input del Router
extension MenuRouter: MenuRouterInputProtocol {
    func canSendMail(delegate: MFMailComposeViewControllerDelegate){
        DispatchQueue.main.async {
            self.viewController?.present(Utils.configuracionMailCompose(delegate: delegate, data: []), animated: true, completion: nil)
        }
    }
    func cantSendMail(){
        DispatchQueue.main.async {
            let vc = AlertDefaultViewController()
            vc.alertManager = CustomAlertManager(type: .failureMail)
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.viewController?.present(vc, animated: true, completion: nil)
        }
    }
    
    func confirmWebviewNavigation(delegate: AlertDefaultViewControllerDelegate){
        DispatchQueue.main.async {
            let vc = AlertDefaultViewController()
            vc.delegate = delegate
            vc.alertManager = CustomAlertManager(type: .navigationWebView)
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.viewController?.present(vc, animated: true, completion: nil)
        }
    }
    
    func showGenericWebView() {
        DispatchQueue.main.async {
            let vc = GenericWebViewCoordinator.navigation()
            self.viewController?.present(vc, animated: true, completion: nil)
        }
    }
}
