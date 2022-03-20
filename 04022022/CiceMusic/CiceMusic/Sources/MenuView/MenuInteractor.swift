import Foundation

// Input del Interactor
protocol MenuInteractorInputProtocol {
    func fetchDataFromInteractor()
}

final class MenuInteractor: BaseInteractor<MenuInteractorOutputProtocol> {
    
    let provider: MenuProviderInputProtocol = MenuProvider()
    
    var dataModel: MenuCoordinatorDTO?
    
}

// Input del Interactor
extension MenuInteractor: MenuInteractorInputProtocol {
    func fetchDataFromInteractor(){
        guard let model = self.dataModel else {return}
        self.presenter?.setDataFromInteractor(data: model.dataModel)
    }
}
