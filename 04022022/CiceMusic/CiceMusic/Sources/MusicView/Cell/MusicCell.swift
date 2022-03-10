//
//  MusicCell.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 8/3/22.
//

import UIKit
import Kingfisher

protocol MusicCellInputProtocol {
    func setupCell(data: GenericResult)
}

class MusicCell: UITableViewCell, ReuseIdentifierProtocol {
    
    //MARK: - IBoutlets
    @IBOutlet weak var artistWorkIV: UIImageView!
    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var artistNameLBL: UILabel!
    @IBOutlet weak var kindLBL: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MusicCell: MusicCellInputProtocol {
    func setupCell(data: GenericResult) {
        
        let url = URL(string: data.artworkUrl100 ?? "")
        let processor = DownsamplingImageProcessor(size: artistWorkIV.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        artistWorkIV.kf.indicatorType = .activity
        artistWorkIV.kf.setImage(
            with: url,
            placeholder: UIImage(named: Constantes.imagePlaceholder),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
        
        self.nameLBL.text = data.name
        self.artistNameLBL.text = data.artistName
        self.kindLBL.text = data.kind        
    }
}
