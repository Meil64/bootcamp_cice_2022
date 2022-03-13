import UIKit

// Output del presenter
protocol BooksPresenterOutputProtocol {
    func reloadInformationInView()
}

class BooksViewController: BaseView<BooksPresenterInputProtocol> {
    
    //MARK: - IBOutlets
    @IBOutlet weak var booksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchBookFromWebService()
        self.configuracionTV()
    }
    
    private func configuracionTV() {
        self.booksTableView.delegate = self
        self.booksTableView.dataSource = self
        self.booksTableView.register(UINib(nibName: MusicCell.defaultReuseIdentifier, bundle: nil),
                                     forCellReuseIdentifier: MusicCell.defaultReuseIdentifier)
    }

}

// Output del Presenter
extension BooksViewController: BooksPresenterOutputProtocol {

    func reloadInformationInView() {
        self.booksTableView.reloadData()
    }
}

extension BooksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.booksTableView.dequeueReusableCell(withIdentifier: MusicCell.defaultReuseIdentifier, for: indexPath) as! MusicCell
        if let model = self.presenter?.informationForCell(indexPath: indexPath.row) {
            cell.setupCell(data: model)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

}
