//
//  PerfilCell.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 22/2/22.
//

import UIKit

protocol PerfilCellDelegate: AnyObject {
    func showCameraPhoto()
}

protocol PerfilCellProtocol {
    func configuracionCell(data: Contact)
}

class PerfilCell: UITableViewCell, ReuseIdentifierProtocol {

    //MARK: - Variables globales
    weak var delegate: PerfilCellDelegate?
    
    //MARK: - IBoutlets
    @IBOutlet weak var photoProfile: UIImageView!
    @IBOutlet weak var usuarioTwitter: UILabel!
    @IBOutlet weak var nombrePerfil: UILabel!
    @IBOutlet weak var apellidoPerfil: UILabel!
    @IBOutlet weak var cvPerfil: UILabel!
    
    //MARK: -IBActions
    @IBAction func buttonFotoACTION(_ sender: UIButton!) {
        self.delegate?.showCameraPhoto()
    }
    
    
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
    func configuracionCell(data: Contact) {        
        if let savedImage = PrefsHelper.getSavedImage() {
            self.photoProfile.image = savedImage
        } else {
            self.photoProfile.image = UIImage(named: data.imageProfile ?? Constants.imagePlaceholder)
        }        
        self.usuarioTwitter.text = data.usernameTwitter
        self.nombrePerfil.text = data.firstName
        self.apellidoPerfil.text = data.lastName
        self.cvPerfil.text = data.descriptionCV
    }    
}
