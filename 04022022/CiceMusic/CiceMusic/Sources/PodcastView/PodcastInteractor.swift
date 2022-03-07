import Foundation

// Input del Interactor
protocol PodcastInteractorInputProtocol {
    
}

final class PodcastInteractor: BaseInteractor<PodcastInteractorOutputProtocol> {
    
    let provider: PodcastProviderInputProtocol = PodcastProvider()
    
}

// Input del Interactor
extension PodcastInteractor: PodcastInteractorInputProtocol {
    
}
