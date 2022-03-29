import Foundation
import MessageUI

// Input del Presenter
protocol MenuPresenterInputProtocol {
    func fetchDataFromPresenter()
    func numberOfRows() -> Int
    func informationForRows(indexPath: Int) -> MenuResponse
    func showWebSite()
    func showMusicViewController()
    func showCalendarViewController()
    func showTipsViewController()
    func sendMail(canSendMail: Bool, delegate: MFMailComposeViewControllerDelegate)
}

// Output del Interactor
protocol MenuInteractorOutputProtocol {
    func setDataFromInteractor(data: [MenuResponse])
}

final class MenuPresenter: BasePresenter<MenuPresenterOutputProtocol, MenuInteractorInputProtocol, MenuRouterInputProtocol> {
    
    var dataSourceMenu: [MenuResponse] = []
    
}

// Input del Presenter
extension MenuPresenter: MenuPresenterInputProtocol {
    func fetchDataFromPresenter(){
        self.interactor?.fetchDataFromInteractor()
    }
    
    func numberOfRows() -> Int{
        return self.dataSourceMenu.count
    }
    
    func informationForRows(indexPath: Int) -> MenuResponse{
        return self.dataSourceMenu[indexPath]
    }
    
    func showWebSite(){
        self.router?.confirmWebviewNavigation(delegate: self)
    }
    func showMusicViewController(){
        
    }
    func showCalendarViewController(){
        
    }
    func showTipsViewController(){
        
    }
    func sendMail(canSendMail: Bool, delegate: MFMailComposeViewControllerDelegate){
        if canSendMail {
            self.router?.canSendMail(delegate: delegate)
        } else {
            self.router?.cantSendMail()
        }
    }
}

// Output del Interactor
extension MenuPresenter: MenuInteractorOutputProtocol {
    func setDataFromInteractor(data: [MenuResponse]){
        self.dataSourceMenu.removeAll()
        self.dataSourceMenu = data
        self.viewController?.reloadInformationInView()
    }
}

extension MenuPresenter: AlertDefaultViewControllerDelegate {
    func leftButtonPressed() {

    }
    
    func rightButtonPressed() {
        self.router?.showGenericWebView()
    }
}
