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
        self.miPerfilPostTableView.register(
            UINib(nibName: PostCell.defaultReuseIdentifier, bundle: nil),
            forCellReuseIdentifier: PostCell.defaultReuseIdentifier)
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
            cellPerfil.delegate = self
            cellPerfil.setupCellPerfil(data: UserDataModel(nombrePerfil: "Carlos Carrera",
                                                           descripcionPerfil: "Developer y mucho texto mucho texto mucho texto mucho texto mucho texto",
                                                           puestoActualPerfil: "Developer",
                                                           usuarioLinkedInPerfil: "@ccarrera",
                                                           imagenPerfil: Constantes.imagePerfil))
            return cellPerfil
        default:
            let cellPost = self.miPerfilPostTableView.dequeueReusableCell(withIdentifier: PostCell.defaultReuseIdentifier, for: indexPath) as! PostCell
            cellPost.setupPostCell(data: UserDataModel(nombrePerfil: "Miranda",
                                                       descripcionPerfil: "mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho textomucho texto mucho texto mucho texto mucho texto mucho texto",
                                                       puestoActualPerfil: "Puesto actual",
                                                       usuarioLinkedInPerfil: "@miranda",
                                                       imagenPerfil: Constantes.imagePost))
            return cellPost
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
            return UITableView.automaticDimension
        }
    }
}

extension ListaPerfilPostViewController: PerfilCellDelegate {
    
    func showAlertB1() {
        let alertVC = UIAlertController(title: "Botón 1", message: "\(#function)", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func showAlertB2() {
        let alertVC = UIAlertController(title: "Botón 2", message: "\(#function)", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func navigationToDetailView(withData: UserDataModel?) {
        let alertVC = UIAlertController(title: "Botón 3", message: withData?.nombrePerfil, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}
