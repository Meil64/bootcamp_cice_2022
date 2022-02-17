//
//  ListaCochesViewController.swift
//  MiAppIntroduccionTableView
//
//  Created by Carlos Carrera on 16/2/22.
//

import UIKit

class ListaCochesViewController: UIViewController {

    // MARK: - Variables globales
    let datasourceMeses = ["Enero", "Febrero", "Marzo", "Abril"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var miMesesAnhoTabeView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constantes.tituloListaMeses
        self.configuracionTableView()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private Methods
    private func configuracionTableView() {
        self.miMesesAnhoTabeView.delegate = self
        self.miMesesAnhoTabeView.dataSource = self
        self.miMesesAnhoTabeView.register(UINib(nibName: MesesCell.defaultReuseIdentifier,
                                                bundle: nil),
                                          forCellReuseIdentifier: MesesCell.defaultReuseIdentifier)
    }
}

extension ListaCochesViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasourceMeses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellMeses = self.miMesesAnhoTabeView.dequeueReusableCell(withIdentifier: MesesCell.defaultReuseIdentifier,
                                                                     for: indexPath) as! MesesCell
        cellMeses.setupCell(model: self.datasourceMeses[indexPath.row])
        return cellMeses
    }
}

extension ListaCochesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
