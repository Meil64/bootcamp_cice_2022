import Foundation

// Input del Presenter
protocol MusicPresenterInputProtocol {
    func loadDataFromInteractor()
    func numberOfRows() -> Int?
    func informationForCell(indexPath: Int) -> ResultMusic?
}

// Output del Interactor
protocol MusicInteractorOutputProtocol {
    func dataTransformedFromInteractor(data: [ResultMusic]?)
}

final class MusicPresenter: BasePresenter<MusicPresenterOutputProtocol, MusicInteractorInputProtocol, MusicRouterInputProtocol> {    
    
    //MARK: - Variables globales
    var dataSourceMusic: [ResultMusic] = []
    
}

// Input del Presenter
extension MusicPresenter: MusicPresenterInputProtocol {
    func loadDataFromInteractor(){
        self.interactor?.transformDataFromInteractor()
    }
    
    func numberOfRows() -> Int? {
        return self.dataSourceMusic.count
    }
    
    func informationForCell(indexPath: Int) -> ResultMusic? {
        return self.dataSourceMusic[indexPath]
    }
}

// Output del Interactor
extension MusicPresenter: MusicInteractorOutputProtocol {
    
    func dataTransformedFromInteractor(data: [ResultMusic]?){
        
        self.dataSourceMusic.removeAll()
        guard let dataSourceUnw = data else { return }
        self.dataSourceMusic = dataSourceUnw
        
        self.viewController?.reloadInformationInView()
    }
}
