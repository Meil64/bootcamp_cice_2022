import UIKit

// Output del presenter
protocol PodcastPresenterOutputProtocol {
    func reloadInformationInView()
}

class PodcastViewController: BaseView<PodcastPresenterInputProtocol> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

}

// Output del Presenter
extension PodcastViewController: PodcastPresenterOutputProtocol {

    func reloadInformationInView() {
        
    }
}
