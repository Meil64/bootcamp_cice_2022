//
//  ListaSuperCochesViewController.swift
//  MiAppIntroduccionTableView
//
//  Created by Carlos Carrera on 17/2/22.
//

import UIKit

class ListaSuperCochesViewController: UIViewController {

    //MARK: - Variables globales
    var dataSourceCoches: [CochesModel] = []
    var imageCoche = UIImage(named: "audi")
    
    //MARK: - IBOutlet
    @IBOutlet weak var miListaCochesTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configuracionUI()
        self.configutacionTableView()
    }
    
    //MARK: - Métodos privados
    private func configuracionUI() {
        self.title = Constantes.tituloListaCoches
        for item in 0..<23 {
            let modelData = CochesModel(nombre: "Audi",
                                        color: "Verde",
                                        imagen: imageCoche)
            dataSourceCoches.append(modelData)
            print("\(dataSourceCoches[item])")
        }
    }

    private func configutacionTableView() {
        self.miListaCochesTableView.delegate = self
        self.miListaCochesTableView.dataSource = self
    }
}

extension ListaSuperCochesViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceCoches.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension ListaSuperCochesViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
