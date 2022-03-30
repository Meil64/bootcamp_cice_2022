//
//  Utils.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 8/3/22.
//

import Foundation
import UIKit
import MessageUI

class Utils {
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static func showAlert(title: String, message: String) -> UIAlertController {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alertVC
    }
    
    static func muestraAlerta(titulo: String, mensaje: String, completionHandler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alertVC = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: completionHandler))
        return alertVC
    }
    
    static func configuracionMailCompose(delegate: MFMailComposeViewControllerDelegate, data: [String]) -> MFMailComposeViewController{
        let mailCompo = MFMailComposeViewController()
        mailCompo.mailComposeDelegate = delegate
        mailCompo.setToRecipients(["info@mail.com", "masinfo@mail.com"])
        mailCompo.setSubject("Asunto del mensaje")
        let emailBody = "\(data)"
        mailCompo.setMessageBody(emailBody, isHTML: false)
        return mailCompo
    }
}

protocol ReuseIdentifierProtocol: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReuseIdentifierProtocol where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension UIViewController {
    func menuButton(){
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu_Iz"),
                                         style: .plain,
                                         target: revealViewController(),
                                         action: #selector(SWRevealViewController.revealToggle(_:)))
        revealViewController().rightViewRevealWidth = 150
        revealViewController().panGestureRecognizer()
        self.navigationItem.leftBarButtonItem = menuButton
    }
}
