import UIKit

// Output del presenter
protocol BooksPresenterOutputProtocol {
    func reloadInformationInView()
}

class BooksViewController: BaseView<BooksPresenterInputProtocol> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

}

// Output del Presenter
extension BooksViewController: BooksPresenterOutputProtocol {

    func reloadInformationInView() {
        
    }
}
