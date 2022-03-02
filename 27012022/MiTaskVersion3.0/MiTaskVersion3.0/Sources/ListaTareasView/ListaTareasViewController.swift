//
//  ListaTareasViewController.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 20/2/22.
//

import UIKit

class ListaTareasViewController: UIViewController {

    // MARK: - Variables globales
    var datasourceTareas: [DownloadNewModel] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var listaTareasTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionTV()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SaveFavoritesPresenter.shared.getAllLocal { results in
            if let resultsUnw = results {
                self.datasourceTareas = resultsUnw.downloads ?? []
                self.listaTareasTableView.reloadData()
            }
        } failure: { error in
            debugPrint(error?.debugDescription ?? "Error recuperando tareas guardadas")
        }
    }

    private func configuracionTV() {
        self.listaTareasTableView.delegate = self
        self.listaTareasTableView.dataSource = self
        //Reutilizo la celda CategoriaCell que habíamos hecho para la otra tabla
        self.listaTareasTableView.register(UINib(nibName: ImageAndLabelsCell.defaultReuseIdentifier, bundle: nil),
                                           forCellReuseIdentifier: ImageAndLabelsCell.defaultReuseIdentifier)
    }
    
}

extension ListaTareasViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasourceTareas.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.listaTareasTableView.dequeueReusableCell(withIdentifier: ImageAndLabelsCell.defaultReuseIdentifier, for: indexPath) as! ImageAndLabelsCell
        
        let textMain = self.datasourceTareas[indexPath.row].newTask
        let textSecondary = self.datasourceTareas[indexPath.row].taskDate ?? ""
        if let taskImageData = self.datasourceTareas[indexPath.row].taskImage {
            cell.configuracionCell(image: UIImage(data: taskImageData),
                                   textMain: textMain,
                                   textSecondary: textSecondary)
        } else {
            cell.configuracionCell(image: nil,
                                   textMain: textMain,
                                   textSecondary: textSecondary)
        }
        
        return cell
    }
    
}
