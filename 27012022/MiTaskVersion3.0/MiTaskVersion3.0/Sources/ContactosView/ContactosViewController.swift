//
//  ContactosViewController.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 20/2/22.
//

import UIKit

class ContactosViewController: UIViewController {

    // MARK: - Variables globales
    var dataSourceContactos: [Contact] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var contactsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDataSourceContacts()
        self.setConfiguracionTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setDataSourceContacts() {
        self.dataSourceContactos = ContactosServerModel.stubbedContactos ?? []
    }
    
    private func setConfiguracionTableView() {
        self.contactsTableView.delegate = self
        self.contactsTableView.dataSource = self
        // Registrar la celda
        self.contactsTableView.register(UINib(nibName: ImageAndLabelsCell.defaultReuseIdentifier,
                                              bundle: nil),
                                        forCellReuseIdentifier: ImageAndLabelsCell.defaultReuseIdentifier)
    }
}

extension ContactosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.dataSourceContactos[indexPath.row]
        let vc = DetalleContactoCoordinator.view(dto: DetalleContactoCoordinatorDTO(model: model))
        self.show(vc, sender: nil)        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension ContactosViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceContactos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.contactsTableView.dequeueReusableCell(
            withIdentifier: ImageAndLabelsCell.defaultReuseIdentifier,
            for: indexPath)
        as! ImageAndLabelsCell
                
        let imagen = UIImage(named: self.dataSourceContactos[indexPath.row].imageProfile ?? Constants.imagePlaceholder)
        let textMain = self.dataSourceContactos[indexPath.row].firstName
        let textSecondary = self.dataSourceContactos[indexPath.row].lastName
        cell.configuracionCell(image: imagen, textMain: textMain, textSecondary: textSecondary)
        return cell
    }
}
