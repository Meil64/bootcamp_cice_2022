//
//  PerfilCell.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 22/2/22.
//

import UIKit

protocol PerfilCellProtocol {
    func configuracionCell(data: ArrayContact)
}

class PerfilCell: UITableViewCell, ReuseIdentifierProtocol {

    //MARK: - IBoutlets
    @IBOutlet weak var photoProfile: UIImageView!
    @IBOutlet weak var usuarioTwitter: UILabel!
    @IBOutlet weak var nombrePerfil: UILabel!
    @IBOutlet weak var apellidoPerfil: UILabel!
    @IBOutlet weak var cvPerfil: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PerfilCell: PerfilCellProtocol {
    func configuracionCell(data: ArrayContact) {
        self.photoProfile.image = UIImage(named: data.imageProfile ?? Constants.imagePlaceholder)
        self.usuarioTwitter.text = data.usernameTwitter
        self.nombrePerfil.text = data.firstName
        self.apellidoPerfil.text = data.lastName
        self.cvPerfil.text = data.descriptionCV
    }    
}
