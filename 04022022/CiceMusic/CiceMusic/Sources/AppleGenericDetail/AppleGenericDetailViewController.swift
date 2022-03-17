import UIKit
import Kingfisher

// Output del presenter
protocol AppleGenericDetailPresenterOutputProtocol {
    func reloadInformationInView()
}

class AppleGenericDetailViewController: BaseView<AppleGenericDetailPresenterInputProtocol> {
    
    // MARK: - IBOutlets
    @IBOutlet weak var backgroundIV: UIImageView!
    @IBOutlet weak var catalogIV: UIImageView!
    @IBOutlet weak var artistNameLBL: UILabel!
    @IBOutlet weak var releaseDateLBL: UILabel!
    @IBOutlet weak var goToAppleStoreBTN: UIButton!
    @IBOutlet weak var appsCollectionView: UICollectionView!
    
    // MARK: - IBAction
    @IBAction func goToAppleStoreACTION(_ sender: Any) {
        self.presenter?.showAppleStore()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchDataFromWebService()
        self.configuracionUI()
        self.configuracionCollectionView()
    }
    
    private func configuracionUI() {
        
        let model = self.presenter?.dataModel
        
        self.backgroundIV.kf.setImage(with: URL(string: model?.artworkUrl100?.replacingOccurrences(of: "100x100", with: "800x800") ?? Constantes.imagePlaceholder))
        self.catalogIV.kf.setImage(with: URL(string: model?.artworkUrl100?.replacingOccurrences(of: "100x100", with: "800x800") ?? Constantes.imagePlaceholder))
        self.artistNameLBL.text = model?.artistName
        self.releaseDateLBL.text = model?.releaseDate
        
        self.catalogIV.layer.cornerRadius = self.catalogIV.frame.width * 0.5
        self.catalogIV.layer.borderColor = UIColor.red.cgColor
        self.catalogIV.layer.borderWidth = 1.5
        
        self.catalogIV.layer.cornerRadius = 10
        self.catalogIV.layer.borderColor = UIColor.black.cgColor
        self.catalogIV.layer.borderWidth = 1.5
    }
    
    private func configuracionCollectionView(){
        self.appsCollectionView.delegate = self
        self.appsCollectionView.dataSource = self
        self.appsCollectionView.register(UINib(nibName: AppsCell.defaultReuseIdentifier, bundle: nil),
                                         forCellWithReuseIdentifier: AppsCell.defaultReuseIdentifier)
    }

}

// Output del Presenter
extension AppleGenericDetailViewController: AppleGenericDetailPresenterOutputProtocol {

    func reloadInformationInView() {
        self.appsCollectionView.reloadData()
    }
}

extension AppleGenericDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter?.numberOfRows() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let appCell = self.appsCollectionView.dequeueReusableCell(withReuseIdentifier: AppsCell.defaultReuseIdentifier, for: indexPath) as! AppsCell
        if let model = self.presenter?.informationForIndexPath(indexpath: indexPath.row) {
            appCell.setupCell(data: model)
        }
        return appCell
    }
}
