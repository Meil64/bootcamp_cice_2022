import Foundation

// Input del Presenter
protocol MenuPresenterInputProtocol {
    func fetchDataFromPresenter()
    func numberOfRows() -> Int
    func informationForRows(indexPath: Int) -> MenuResponse
}

// Output del Interactor
protocol MenuInteractorOutputProtocol {
    func setDataFromInteractor(data: [MenuResponse])
}

final class MenuPresenter: BasePresenter<MenuPresenterOutputProtocol, MenuInteractorInputProtocol, MenuRouterInputProtocol> {
    
    var dataSourceMenu: [MenuResponse] = []
    
}

// Input del Presenter
extension MenuPresenter: MenuPresenterInputProtocol {
    func fetchDataFromPresenter(){
        self.interactor?.fetchDataFromInteractor()
    }
    
    func numberOfRows() -> Int{
        return self.dataSourceMenu.count
    }
    
    func informationForRows(indexPath: Int) -> MenuResponse{
        return self.dataSourceMenu[indexPath]
    }
}

// Output del Interactor
extension MenuPresenter: MenuInteractorOutputProtocol {
    func setDataFromInteractor(data: [MenuResponse]){
        self.dataSourceMenu.removeAll()
        self.dataSourceMenu = data
        self.viewController?.reloadInformationInView()
    }
}
