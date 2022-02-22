//
//  DetalleContactoViewController.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 22/2/22.
//

import UIKit

class DetalleContactoViewController: UIViewController {
    
    //MARK: - Variables globales
    var dataModel: ArrayContact?
    
    //MARK: - IBoutlets
    @IBOutlet weak var detalleContactoTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionTableView()
    }
    
    private func configuracionTableView() {
        self.detalleContactoTableView.delegate = self
        self.detalleContactoTableView.dataSource = self
        self.detalleContactoTableView.register(UINib(nibName: PerfilCell.defaultReuseIdentifier, bundle: nil),
                                               forCellReuseIdentifier: PerfilCell.defaultReuseIdentifier)
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
        if let modelData = self.dataModel {
            cell.configuracionCell(data: modelData)
        }
        return cell
    }
}
