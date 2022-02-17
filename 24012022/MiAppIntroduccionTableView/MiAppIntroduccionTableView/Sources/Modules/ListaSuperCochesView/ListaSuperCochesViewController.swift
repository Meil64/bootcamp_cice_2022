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
        self.miListaCochesTableView.register(UINib(nibName: CochesCell.defaultReuseIdentifier,
                                                   bundle: nil),
                                             forCellReuseIdentifier: CochesCell.defaultReuseIdentifier)
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
        let cellCoches = self.miListaCochesTableView.dequeueReusableCell(
            withIdentifier: CochesCell.defaultReuseIdentifier,
            for: indexPath)
        as! CochesCell
        cellCoches.setuCell(data: self.dataSourceCoches[indexPath.row])
        return cellCoches
    }
}

extension ListaSuperCochesViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.dataSourceCoches[indexPath.row]
        print("\(model.nombre ?? "OJO ")" + "\(self.dataSourceCoches[indexPath.row])")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
