//
//  CochesCell.swift
//  MiAppIntroduccionTableView
//
//  Created by Carlos Carrera on 17/2/22.
//

import UIKit

protocol CochesCellProtocol {
    func setuCell(data: CochesModel?)
}

class CochesCell: UITableViewCell, ReuseIdentifierView {

    // MARK: - IBOutlet
    @IBOutlet weak var miCocheIV: UIImageView!
    @IBOutlet weak var miNombreCocheLBL: UILabel!
    @IBOutlet weak var miColorCocheLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CochesCell: CochesCellProtocol {
    func setuCell(data: CochesModel?) {
        self.miNombreCocheLBL.text = data?.nombre
        self.miColorCocheLBL.text = data?.color
        self.miCocheIV.image = data?.imagen
    }
}
