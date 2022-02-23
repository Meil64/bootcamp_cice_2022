//
//  ContactosCell.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 21/2/22.
//

import UIKit

protocol ContactosCellProtocol {
    func configuracionCell(data: Contact)
}

class ContactosCell: UITableViewCell, ReuseIdentifierProtocol {

    //MARK: - IBOutlets
    @IBOutlet weak var imagePerfil: UIImageView!
    @IBOutlet weak var nombrePerfil: UILabel!
    @IBOutlet weak var apellidoPerfil: UILabel!
    @IBOutlet weak var customContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configuracionUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configuracionUI() {
        self.imagePerfil.layer.cornerRadius = self.imagePerfil.frame.width * 0.5
        self.imagePerfil.layer.borderWidth = 1
        self.imagePerfil.layer.borderColor = UIColor.gray.cgColor
        self.customContentView.layer.cornerRadius = 12
        self.customContentView.layer.borderWidth = 0.3
        self.customContentView.layer.borderColor = UIColor.lightGray.cgColor
        self.addShadow(item: self.customContentView)
    }
    
    private func addShadow(item: UIView) {
        item.layer.shadowColor = UIColor.black.cgColor
        item.layer.shadowOpacity = 0.5
        item.layer.shadowRadius = 12
        item.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
}

extension ContactosCell: ContactosCellProtocol {
    func configuracionCell(data: Contact) {
        self.imagePerfil.image = UIImage(named: data.imageProfile ?? Constants.imagePlaceholder)
        self.nombrePerfil.text = data.firstName
        self.apellidoPerfil.text = data.lastName
    }
}
