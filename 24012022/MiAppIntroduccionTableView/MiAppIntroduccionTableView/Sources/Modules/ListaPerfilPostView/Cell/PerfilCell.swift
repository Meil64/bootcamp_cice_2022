//
//  PerfilCell.swift
//  MiAppIntroduccionTableView
//
//  Created by Carlos Carrera on 17/2/22.
//

import UIKit

protocol PerfilCellDelegate: AnyObject {
    func showAlertB1()
    func showAlertB2()
    func navigationToDetailView(withData: UserDataModel?)
}

protocol PerfilCellProtocol {
    func setupCellPerfil(data: UserDataModel?)
}

class PerfilCell: UITableViewCell, ReuseIdentifierView {

    //MARK: - Variables globales
    weak var delegate: PerfilCellDelegate?
    var modelData: UserDataModel?
    
    //MARK: - IBOutlets
    @IBOutlet weak var miImagenPerfil: UIImageView!
    @IBOutlet weak var miUsuarioLinkedinLBL: UILabel!
    @IBOutlet weak var miNombrePerfilLBL: UILabel!
    @IBOutlet weak var miDescripcionCVLBL: UILabel!
    @IBOutlet weak var miPuestoActualLBL: UILabel!
    
    //MARK: - IBAction
    @IBAction func senderEventAlertB1ACTION(_ sender: UIButton) {
        self.delegate?.showAlertB1()
    }
    @IBAction func senderEventAlertB2ACTION(_ sender: UIButton) {
        self.delegate?.showAlertB2()
    }
    @IBAction func senderEventAlertB3ACTION(_ sender: UIButton) {
        self.delegate?.navigationToDetailView(withData: self.modelData)
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
    func setupCellPerfil(data: UserDataModel?){
        self.modelData = data
        self.miImagenPerfil.image = UIImage(named: data?.imagenPerfil ?? Constantes.imagePlaceholder)
        self.miUsuarioLinkedinLBL.text = data?.usuarioLinkedInPerfil
        self.miNombrePerfilLBL.text = data?.nombrePerfil
        self.miDescripcionCVLBL.text = data?.descripcionPerfil
        self.miPuestoActualLBL.text = data?.puestoActualPerfil
    }
}
