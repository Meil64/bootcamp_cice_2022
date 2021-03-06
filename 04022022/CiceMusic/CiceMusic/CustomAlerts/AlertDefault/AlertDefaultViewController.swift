//
//  AlertDefautlViewController.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 23/3/22.
//

import UIKit

protocol AlertDefaultViewControllerDelegate: AnyObject {
    func leftButtonPressed()
    func rightButtonPressed()
}


class AlertDefaultViewController: UIViewController {

    //MARK: - Variables globales
    var alertManager: CustomAlertManager?
    var type: DefaultAlertType?
    weak var delegate: AlertDefaultViewControllerDelegate?
    
    //MARK: - IBOutlets
    @IBOutlet weak var tituloLBL: UILabel!
    @IBOutlet weak var mensageAlertLBL: UILabel!
    @IBOutlet weak var leftBTN: UIButton!
    @IBOutlet weak var rightBTN: UIButton!
    @IBOutlet weak var closeBTN: UIButton!
    @IBOutlet weak var bodyView: UIView!
    
    @IBOutlet weak var constHeightButtonClose: NSLayoutConstraint!
    @IBOutlet weak var constHeightLeftButton: NSLayoutConstraint!
    @IBOutlet weak var constHeightRightButton: NSLayoutConstraint!
    
    //MARK: - IBActions
    @IBAction func closeACTION(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func leftButtonACTION(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.leftButtonPressed()
        }
    }
    @IBAction func rightButtonACTION(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.rightButtonPressed()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
    }

    private func configuracionUI(){
        
        self.leftBTN.layer.cornerRadius = constHeightLeftButton.constant * 0.5
        self.rightBTN.layer.cornerRadius = constHeightRightButton.constant * 0.5
        self.bodyView.layer.cornerRadius = 10
        
        switch alertManager?.type {
        case .successLogin:
            self.tituloLBL.text = alertManager?.successLoginTitle
            self.mensageAlertLBL.text = alertManager?.successLoginMessage
            self.leftBTN.isHidden = true
            self.rightBTN.setTitle(alertManager?.rightButton, for: .normal)
            self.closeBTN.isHidden = true
            self.constHeightButtonClose.constant = 0
            
        case .failureLogin:
            self.tituloLBL.text = alertManager?.failureLoginTitle
            self.mensageAlertLBL.text = alertManager?.failureLoginMessage
            self.leftBTN.setTitle(alertManager?.leftButton, for: .normal)
            self.rightBTN.isHidden = true
            
        case .successMail:
            self.tituloLBL.text = alertManager?.successMailTitle
            self.mensageAlertLBL.text = alertManager?.successMailMessage
            self.leftBTN.isHidden = true
            self.rightBTN.setTitle(alertManager?.rightButton, for: .normal)
            self.closeBTN.isHidden = true
            self.constHeightButtonClose.constant = 0
            
        case .failureMail:
            self.tituloLBL.text = alertManager?.failureMailTitle
            self.mensageAlertLBL.text = alertManager?.failureMailMessage
            self.leftBTN.setTitle(alertManager?.leftButton, for: .normal)
            self.rightBTN.isHidden = true
            
        case .navigationWebView:
            self.tituloLBL.text = alertManager?.webViewTitle
            self.mensageAlertLBL.text = alertManager?.webViewMessage
            self.leftBTN.setTitle(alertManager?.leftButton, for: .normal)
            self.rightBTN.setTitle(alertManager?.rightButton, for: .normal)
            
        default:
            self.tituloLBL.text = ""
            self.mensageAlertLBL.text = ""
            self.leftBTN.isHidden = true
            self.rightBTN.isHidden = true
        }
    }

}
