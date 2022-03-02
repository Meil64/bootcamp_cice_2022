//
//  CategoriasViewController.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 20/2/22.
//

import UIKit

protocol CategoriaViewControllerDelegate: AnyObject {
    func nombreCategoriaSeleccionada(categoria: String)
}



class CategoriasViewController: UIViewController {

    //MARK: - Variables globales
    var nombreCategoriaSeleccionada = ""
    var seleccionIndexPath = IndexPath()
    let datasourceCategorias = ["Sin Categoria", "Tienda de Apple", "Bar con los amigos", "En la librería", "En el Corte Inglés", "En el Mercadona", "En casa"]
    
    weak var delegate: CategoriaViewControllerDelegate?
    
    //MARK: - IBOutlets
    @IBOutlet weak var categoriaTableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDatasource()
        self.configuracionUI()
    }
    
    private func setupDatasource() {
        for index in 0..<datasourceCategorias.count{
            if self.datasourceCategorias[index] == self.nombreCategoriaSeleccionada{
                self.seleccionIndexPath = IndexPath(row: index, section: 0)
            }
        }
    }
    
    private func configuracionUI(){
        self.categoriaTableView.delegate = self
        self.categoriaTableView.dataSource = self
        self.categoriaTableView.register(UINib(nibName: CategoriaCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: CategoriaCell.defaultReuseIdentifier)
    }

}

extension CategoriasViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasourceCategorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.categoriaTableView.dequeueReusableCell(withIdentifier: CategoriaCell.defaultReuseIdentifier, for: indexPath) as! CategoriaCell
        cell.nombreCategoriaLBL.text = self.datasourceCategorias[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath != self.seleccionIndexPath {
            self.seleccionIndexPath = indexPath
            self.nombreCategoriaSeleccionada = datasourceCategorias[indexPath.row]
            self.delegate?.nombreCategoriaSeleccionada(categoria: self.nombreCategoriaSeleccionada)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    
}
