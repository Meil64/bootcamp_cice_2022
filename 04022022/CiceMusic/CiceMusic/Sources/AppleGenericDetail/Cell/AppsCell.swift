//
//  AppsCell.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 17/3/22.
//

import UIKit
import Kingfisher

protocol AppsCellProtocol {
    func setupCell(data: GenericResult)
}

class AppsCell: UICollectionViewCell, ReuseIdentifierProtocol {

    //MARK: - IBOutlets
    @IBOutlet weak var appsIV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension AppsCell: AppsCellProtocol{
    func setupCell(data: GenericResult) {
        guard let urlUnw = URL(string: data.artworkUrl100 ?? Constantes.imagePlaceholder) else {return}
        self.appsIV.kf.setImage(with: urlUnw)
    }
}
