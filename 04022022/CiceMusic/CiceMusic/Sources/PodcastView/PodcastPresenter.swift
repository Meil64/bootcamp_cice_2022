import Foundation

// Input del Presenter
protocol PodcastPresenterInputProtocol {
    func fetchPodcastFromWebService()
    func numberOfRows() -> Int?
    func informationForCell(indexPath: Int) -> GenericResult?
}

// Output del Interactor
protocol PodcastInteractorOutputProtocol {
    func setDataFromWebInteractor(data: [GenericResult]?)
    func setAlertMessage(error: NetworkError)
}

final class PodcastPresenter: BasePresenter<PodcastPresenterOutputProtocol, PodcastInteractorInputProtocol, PodcastRouterInputProtocol> {
    
    var dataSourceViewModel: [GenericResult] = []
    
}

// Input del Presenter
extension PodcastPresenter: PodcastPresenterInputProtocol {
    func fetchPodcastFromWebService(){
        self.interactor?.fetchPodcastFromWebServiceInteractor()
    }
    
    func numberOfRows() -> Int? {
        return self.dataSourceViewModel.count
    }
    
    func informationForCell(indexPath: Int) -> GenericResult? {
        return self.dataSourceViewModel[indexPath]
    }
}

// Output del Interactor
extension PodcastPresenter: PodcastInteractorOutputProtocol {
    func setDataFromWebInteractor(data: [GenericResult]?) {
        guard let dataUnw = data else {return}
        self.dataSourceViewModel.removeAll()
        self.dataSourceViewModel = dataUnw
        self.viewController?.reloadInformationInView()
    }
    
    func setAlertMessage(error: NetworkError) {
        self.router?.showAlert(title: error.description, message: error.localizedDescription)
    }
}
