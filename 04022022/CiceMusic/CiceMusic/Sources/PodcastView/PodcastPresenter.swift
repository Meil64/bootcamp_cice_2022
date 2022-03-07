import Foundation

// Input del Presenter
protocol PodcastPresenterInputProtocol {
    
}

// Output del Interactor
protocol PodcastInteractorOutputProtocol {
    
}

final class PodcastPresenter: BasePresenter<PodcastPresenterOutputProtocol, PodcastInteractorInputProtocol, PodcastRouterInputProtocol> {
    
    
    
}

// Input del Presenter
extension PodcastPresenter: PodcastPresenterInputProtocol {
    
}

// Output del Interactor
extension PodcastPresenter: PodcastInteractorOutputProtocol {
    
}
