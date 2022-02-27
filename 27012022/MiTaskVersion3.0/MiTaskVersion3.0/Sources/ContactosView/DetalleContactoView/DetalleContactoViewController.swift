//
//  DetalleContactoViewController.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 22/2/22.
//

import UIKit
import MessageUI

class DetalleContactoViewController: UIViewController {
    
    //MARK: - Variables globales
    var dataModel: Contact?
    
    //MARK: - IBoutlets
    @IBOutlet weak var detalleContactoTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        self.configuracionTableView()
    }
    
    private func configuracionUI() {
        let buttonMail = UIBarButtonItem(image: UIImage(systemName: "mail"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(configuracionMail))
        self.navigationItem.rightBarButtonItem = buttonMail
    }
    
    private func configuracionTableView() {
        self.detalleContactoTableView.delegate = self
        self.detalleContactoTableView.dataSource = self
        self.detalleContactoTableView.register(UINib(nibName: PerfilCell.defaultReuseIdentifier, bundle: nil),
                                               forCellReuseIdentifier: PerfilCell.defaultReuseIdentifier)
    }
    
    @objc
    func configuracionMail() {
        if MFMailComposeViewController.canSendMail() {
            self.present(MailHelper.configuracionMailCompose(delegate: self, contactData: dataModel),
                         animated: true,
                         completion: nil)
        } else {
            self.present(Utils.muestraAlerta(titulo: "hey!",
                                             mensaje: "Estás en un Simulador y no puedes enviar email",
                                             completionHandler: nil),
                        animated: true,
                        completion: nil)
        }
    }
}

extension DetalleContactoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension DetalleContactoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.detalleContactoTableView.dequeueReusableCell(withIdentifier: PerfilCell.defaultReuseIdentifier, for: indexPath) as! PerfilCell
        cell.delegate = self
        if let modelData = self.dataModel {
            cell.configuracionCell(data: modelData)
        }
        return cell
    }
}

extension DetalleContactoViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        DispatchQueue.main.async {
            controller.dismiss(animated: true, completion: nil)
        }
    }
}

extension DetalleContactoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        //Código defensivo para evitar bloqueos en el hilo principal
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickerImageUnw = info[.originalImage] as? UIImage {
            UserDefaultsHelper.saveImage(image: pickerImageUnw)
            self.detalleContactoTableView.reloadData()
        }
        
        //Código defensivo para evitar bloqueos en el hilo principal
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension DetalleContactoViewController: PerfilCellDelegate {
    func showCameraPhoto() {
        GetPhotoHelper.muestraFotoMenu(delegate: self, viewController: self)
    }
}
