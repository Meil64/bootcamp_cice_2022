import Foundation

// Input del Presenter
protocol AppleGenericDetailPresenterInputProtocol {
    var dataModel: GenericResult? { get set }
    func showAppleStore()
    func fetchDataFromWebService()
    func numberOfRows() -> Int
    func informationForIndexPath(indexpath: Int) -> GenericResult?
}

// Output del Interactor
protocol AppleGenericDetailInteractorOutputProtocol {
    func setDataFromWebInteractor(data: [GenericResult]?)
}

final class AppleGenericDetailPresenter: BasePresenter<AppleGenericDetailPresenterOutputProtocol, AppleGenericDetailInteractorInputProtocol, AppleGenericDetailRouterInputProtocol> {
    
    var dataModel: GenericResult?
    var arrayDataModel: [GenericResult] = []
    
}

// Input del Presenter
extension AppleGenericDetailPresenter: AppleGenericDetailPresenterInputProtocol {
    func showAppleStore(){
        guard let dataModelUnw = self.dataModel else {return}
        self.router?.showAppleStoreRouter(data: dataModelUnw)
    }
    
    func fetchDataFromWebService(){
        self.interactor?.fetchDataFromWebServiceInteractor()
    }
    
    func numberOfRows() -> Int {
        return self.arrayDataModel.count
    }
    
    func informationForIndexPath(indexpath: Int) -> GenericResult? {
        return self.arrayDataModel[indexpath]
    }
}

// Output del Interactor
extension AppleGenericDetailPresenter: AppleGenericDetailInteractorOutputProtocol {
    func setDataFromWebInteractor(data: [GenericResult]?){
        self.arrayDataModel.removeAll()
        guard let arrayDataModelUnw = data else {return}
        self.arrayDataModel = arrayDataModelUnw
        self.viewController?.reloadInformationInView()
    }
}
