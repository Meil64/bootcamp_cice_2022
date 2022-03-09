import Foundation

// Input del Interactor
protocol MusicInteractorInputProtocol {
    func transformDataFromInteractor()
}

final class MusicInteractor: BaseInteractor<MusicInteractorOutputProtocol> {
    
    // ID
    let provider: MusicProviderInputProtocol = MusicProvider()
    
    //MARK: - Variables globales
    var data: MusicCoordinatorDTO?
    
}

// Input del Interactor
extension MusicInteractor: MusicInteractorInputProtocol {
    
    func transformDataFromInteractor(){
        guard let dataUnw = self.data else { return }
        self.presenter?.dataTransformedFromInteractor(data: dataUnw.model)
    }
    
}
