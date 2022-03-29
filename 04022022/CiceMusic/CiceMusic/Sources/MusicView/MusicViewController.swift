import UIKit

// Output del presenter
protocol MusicPresenterOutputProtocol {
    func reloadInformationInView()
}

class MusicViewController: BaseView<MusicPresenterInputProtocol> {
    
    //MARK: - IBOutlets
    @IBOutlet weak var musicTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLoading()
        self.presenter?.loadDataFromInteractor()
        self.configuracionTV()
        self.menuButton()
    }

    private func configuracionTV() {
        self.musicTableView.delegate = self
        self.musicTableView.dataSource = self
        self.musicTableView.register(UINib(nibName: MusicCell.defaultReuseIdentifier, bundle: nil),
                                     forCellReuseIdentifier: MusicCell.defaultReuseIdentifier)
    }
    
}

// Output del Presenter
extension MusicViewController: MusicPresenterOutputProtocol {

    func reloadInformationInView() {
        self.musicTableView.reloadData()
        self.hideLoading()
    }
}

extension MusicViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.musicTableView.dequeueReusableCell(withIdentifier: MusicCell.defaultReuseIdentifier, for: indexPath) as! MusicCell
        if let model = self.presenter?.informationForCell(indexPath: indexPath.row) {
            cell.setupCell(data: model)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let model = self.presenter?.informationForCell(indexPath: indexPath.row) {
            self.presenter?.didSelectRow(data: model)
        }
    }

}
