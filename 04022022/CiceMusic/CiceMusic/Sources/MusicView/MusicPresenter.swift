import Foundation

// Input del Presenter
protocol MusicPresenterInputProtocol {
    
}

// Output del Interactor
protocol MusicInteractorOutputProtocol {
    
}

final class MusicPresenter: BasePresenter<MusicPresenterOutputProtocol, MusicInteractorInputProtocol, MusicRouterInputProtocol> {
    
    
    
}

// Input del Presenter
extension MusicPresenter: MusicPresenterInputProtocol {
    
}

// Output del Interactor
extension MusicPresenter: MusicInteractorOutputProtocol {
    
}
