import Foundation

// Input del Presenter
protocol MusicPresenterInputProtocol {
    func loadDataFromInteractor()
    func numberOfRows() -> Int?
    func informationForCell(indexPath: Int) -> GenericResult?
}

// Output del Interactor
protocol MusicInteractorOutputProtocol {
    func dataTransformedFromInteractor(data: [GenericResult]?)
}

final class MusicPresenter: BasePresenter<MusicPresenterOutputProtocol, MusicInteractorInputProtocol, MusicRouterInputProtocol> {    
    
    //MARK: - Variables globales
    var dataSourceViewModel: [GenericResult] = []
    
}

// Input del Presenter
extension MusicPresenter: MusicPresenterInputProtocol {
    func loadDataFromInteractor(){
        self.interactor?.transformDataFromInteractor()
    }
    
    func numberOfRows() -> Int? {
        return self.dataSourceViewModel.count
    }
    
    func informationForCell(indexPath: Int) -> GenericResult? {
        return self.dataSourceViewModel[indexPath]
    }
}

// Output del Interactor
extension MusicPresenter: MusicInteractorOutputProtocol {
    
    func dataTransformedFromInteractor(data: [GenericResult]?){
        
        self.dataSourceViewModel.removeAll()
        guard let dataSourceUnw = data else { return }
        self.dataSourceViewModel = dataSourceUnw
        
        self.viewController?.reloadInformationInView()
    }
}
