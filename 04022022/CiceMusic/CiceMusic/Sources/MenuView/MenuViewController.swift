import UIKit

// Output del presenter
protocol MenuPresenterOutputProtocol {
    func reloadInformationInView()
}

class MenuViewController: BaseView<MenuPresenterInputProtocol> {
    
    //MARK: - IBOutlet
    @IBOutlet weak var menuTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchDataFromPresenter()
        self.configuracionTV()
    }

    private func configuracionTV(){
        self.menuTV.delegate = self
        self.menuTV.dataSource = self
        self.menuTV.register(UINib(nibName: MenuCell.defaultReuseIdentifier, bundle: nil),
                             forCellReuseIdentifier: MenuCell.defaultReuseIdentifier)
    }
}

// Output del Presenter
extension MenuViewController: MenuPresenterOutputProtocol {

    func reloadInformationInView() {
        
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRows() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuCell = self.menuTV.dequeueReusableCell(withIdentifier: MenuCell.defaultReuseIdentifier,
                                                       for: indexPath) as! MenuCell
        if let model = self.presenter?.informationForRows(indexPath: indexPath.row){
            menuCell.setupCell(data: model)
        }
        
        return menuCell
    }
}
