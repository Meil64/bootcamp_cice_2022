import UIKit

// Output del presenter
protocol PodcastPresenterOutputProtocol {
    func reloadInformationInView()
}

class PodcastViewController: BaseView<PodcastPresenterInputProtocol> {
    
    //MARK: - IBOutlets
    @IBOutlet weak var podcastTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchPodcastFromWebService()
        self.configuracionTV()
    }
    
    private func configuracionTV() {
        self.podcastTableView.delegate = self
        self.podcastTableView.dataSource = self
        self.podcastTableView.register(UINib(nibName: MusicCell.defaultReuseIdentifier, bundle: nil),
                                     forCellReuseIdentifier: MusicCell.defaultReuseIdentifier)
    }

}

// Output del Presenter
extension PodcastViewController: PodcastPresenterOutputProtocol {

    func reloadInformationInView() {
        self.podcastTableView.reloadData()
    }
}

extension PodcastViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.podcastTableView.dequeueReusableCell(withIdentifier: MusicCell.defaultReuseIdentifier, for: indexPath) as! MusicCell
        if let model = self.presenter?.informationForCell(indexPath: indexPath.row) {
            cell.setupCell(data: model)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

}
