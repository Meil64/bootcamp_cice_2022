import Foundation

// Input del Interactor
protocol MusicInteractorInputProtocol {
    
}

final class MusicInteractor: BaseInteractor<MusicInteractorOutputProtocol> {
    
    let provider: MusicProviderInputProtocol = MusicProvider()
    
}

// Input del Interactor
extension MusicInteractor: MusicInteractorInputProtocol {
    
}
