//
//  PostCell.swift
//  MiAppIntroduccionTableView
//
//  Created by Carlos Carrera on 17/2/22.
//

import UIKit

protocol PostCellProtocol {
    func setupPostCell(data: UserDataModel?)
}

class PostCell: UITableViewCell, ReuseIdentifierView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var miImagenPost: UIImageView!
    @IBOutlet weak var miNombrePostLBL: UILabel!
    @IBOutlet weak var miPuestoPostLBL: UILabel!
    @IBOutlet weak var miFechaPostLBL: UILabel!
    @IBOutlet weak var miDescripcionPostLBL: UILabel!
    @IBOutlet weak var miTituloPostLBL: UILabel!
    @IBOutlet weak var miLikesPostLBL: UILabel!
    @IBOutlet weak var miComentariosPostLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configuracionUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configuracionUI() {
        self.miImagenPost.layer.cornerRadius = self.miImagenPost.frame.width * 0.5
    }
    
}

extension PostCell: PostCellProtocol {
    func setupPostCell(data: UserDataModel?) {
        self.miImagenPost.image = UIImage(named: data?.imagenPerfil ?? Constantes.imagePlaceholder)
        self.miNombrePostLBL.text = data?.nombrePerfil
        self.miPuestoPostLBL.text = data?.puestoActualPerfil
        self.miFechaPostLBL.text = "\(Date())"
        self.miDescripcionPostLBL.text = data?.descripcionPerfil
        self.miTituloPostLBL.text = "Estamos lanzando la App"
        self.miLikesPostLBL.text = "Likes: 1k"
        self.miComentariosPostLBL.text = "Comentarios: 2k"
    }
}
