import Foundation

// Input del Presenter
protocol PodcastPresenterInputProtocol {
    func fetchPodcastFromWebService()
}

// Output del Interactor
protocol PodcastInteractorOutputProtocol {
    
}

final class PodcastPresenter: BasePresenter<PodcastPresenterOutputProtocol, PodcastInteractorInputProtocol, PodcastRouterInputProtocol> {
    
    
    
}

// Input del Presenter
extension PodcastPresenter: PodcastPresenterInputProtocol {
    func fetchPodcastFromWebService(){
        self.interactor?.fetchPodcastFromWebServiceInteractor()
    }
}

// Output del Interactor
extension PodcastPresenter: PodcastInteractorOutputProtocol {
    
}
