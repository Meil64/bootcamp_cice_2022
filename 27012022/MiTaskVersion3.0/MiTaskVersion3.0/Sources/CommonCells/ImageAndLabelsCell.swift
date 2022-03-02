//
//  ImageAndLabelsCell.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 2/3/22.
//

import UIKit

protocol ImageAndLabelsCellProtocol {
    func configuracionCell(image: UIImage?, textMain: String?, textSecondary: String?)
}

class ImageAndLabelsCell: UITableViewCell, ReuseIdentifierProtocol {

    //MARK: - IBOutlets
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var labelMain: UILabel!
    @IBOutlet weak var labelSecondary: UILabel!
    @IBOutlet weak var cellContentView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configuracionUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configuracionUI() {
        self.cellImageView.layer.cornerRadius = self.cellImageView.frame.width * 0.5
        self.cellImageView.layer.borderWidth = 1
        self.cellImageView.layer.borderColor = UIColor.gray.cgColor
        self.cellContentView.layer.cornerRadius = 12
        self.cellContentView.layer.borderWidth = 0.3
        self.cellContentView.layer.borderColor = UIColor.lightGray.cgColor
        self.addShadow(item: self.cellContentView)
    }
    
    private func addShadow(item: UIView) {
        item.layer.shadowColor = UIColor.black.cgColor
        item.layer.shadowOpacity = 0.5
        item.layer.shadowRadius = 12
        item.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }    
}

extension ImageAndLabelsCell: ImageAndLabelsCellProtocol {
    func configuracionCell(image: UIImage?, textMain: String?, textSecondary: String?) {
        self.cellImageView.image = image ?? UIImage(named: Constants.imagePlaceholder)
        self.labelMain.text = textMain ?? ""
        self.labelSecondary.text = textSecondary ?? ""
    }
}
