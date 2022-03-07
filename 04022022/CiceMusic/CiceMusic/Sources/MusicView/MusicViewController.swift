import UIKit

// Output del presenter
protocol MusicPresenterOutputProtocol {
    func reloadInformationInView()
}

class MusicViewController: BaseView<MusicPresenterInputProtocol> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

}

// Output del Presenter
extension MusicViewController: MusicPresenterOutputProtocol {

    func reloadInformationInView() {
        
    }
}
