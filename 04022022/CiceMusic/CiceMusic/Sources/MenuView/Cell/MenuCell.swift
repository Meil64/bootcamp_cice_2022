//
//  MenuCell.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 20/3/22.
//

import UIKit

protocol MenuCellProtocol {
    func setupCell(data: MenuResponse)
}

class MenuCell: UITableViewCell, ReuseIdentifierProtocol {

    //MARK: - IBOutlet
    @IBOutlet weak var iconIV: UIImageView!
    @IBOutlet weak var nameMenuLBL: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func showImageWithName(data: Menu) -> UIImage {
        switch data.imagen {
        case "iconoAvatar":
            return #imageLiteral(resourceName: "iconoAvatar")
        case "musicAvatar":
            return #imageLiteral(resourceName: "musicAvatar")
        case "calendarioAvatar":
            return #imageLiteral(resourceName: "calendarioAvatar")
        case "consejosAvatar":
            return #imageLiteral(resourceName: "consejosAvatar")
        default:
            return #imageLiteral(resourceName: "nosotrosAvatar")
        }
    }
}

extension MenuCell: MenuCellProtocol {
    func setupCell(data: MenuResponse){
        if let dataUnw = data.menu {
            self.nameMenuLBL.text = data.menu?.literal
            self.iconIV.image = self.showImageWithName(data: dataUnw)
        }
    }
}
