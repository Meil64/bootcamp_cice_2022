//
//  ListaPerfilPostViewController.swift
//  MiAppIntroduccionTableView
//
//  Created by Carlos Carrera on 17/2/22.
//

import UIKit

class ListaPerfilPostViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var miPerfilPostTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionTableView()
        
        // Do any additional setup after loading the view.
    }

    private func configuracionTableView() {
        self.miPerfilPostTableView.delegate = self
        self.miPerfilPostTableView.dataSource = self
        self.miPerfilPostTableView.register(
            UINib(nibName: PerfilCell.defaultReuseIdentifier, bundle: nil),
            forCellReuseIdentifier: PerfilCell.defaultReuseIdentifier)
    }
    
}

extension ListaPerfilPostViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellPerfil = self.miPerfilPostTableView.dequeueReusableCell(withIdentifier: PerfilCell.defaultReuseIdentifier, for: indexPath) as! PerfilCell
            cellPerfil.setupCellPerfil(data: UserDataModel(nombrePerfil: "Carlos Carrera",
                                                           descripcionPerfil: "Developer y mucho texto mucho texto mucho texto mucho texto mucho texto",
                                                           puestoActualPerfil: "Developer",
                                                           usuarioLinkedInPerfil: "@ccarrera",
                                                           imagenPerfil: "fotoPerfil"))
            return cellPerfil
        default:
            return UITableViewCell()
        }
    }
}

extension ListaPerfilPostViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 320
        default:
            return 44
        }
    }
    
}
