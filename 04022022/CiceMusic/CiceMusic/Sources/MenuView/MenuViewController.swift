import UIKit

// Output del presenter
protocol MenuPresenterOutputProtocol {
    func reloadInformationInView()
}

class MenuViewController: BaseView<MenuPresenterInputProtocol> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

}

// Output del Presenter
extension MenuViewController: MenuPresenterOutputProtocol {

    func reloadInformationInView() {
        
    }
}
