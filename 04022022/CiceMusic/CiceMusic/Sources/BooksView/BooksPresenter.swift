import Foundation

// Input del Presenter
protocol BooksPresenterInputProtocol {
    func fetchBookFromWebService()
    func numberOfRows() -> Int?
    func informationForCell(indexPath: Int) -> GenericResult?
}

// Output del Interactor
protocol BooksInteractorOutputProtocol {
    func setDataFromWebInteractor(data: [GenericResult]?)
    func setAlertMessage(error: NetworkError)
}

final class BooksPresenter: BasePresenter<BooksPresenterOutputProtocol, BooksInteractorInputProtocol, BooksRouterInputProtocol> {
    
    var dataSourceViewModel: [GenericResult] = []
    
}

// Input del Presenter
extension BooksPresenter: BooksPresenterInputProtocol {
    func fetchBookFromWebService(){
        self.interactor?.fetchBookFromWebServiceInteractor()
    }
    
    func numberOfRows() -> Int? {
        return self.dataSourceViewModel.count
    }
    
    func informationForCell(indexPath: Int) -> GenericResult? {
        return self.dataSourceViewModel[indexPath]
    }
}

// Output del Interactor
extension BooksPresenter: BooksInteractorOutputProtocol {
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
