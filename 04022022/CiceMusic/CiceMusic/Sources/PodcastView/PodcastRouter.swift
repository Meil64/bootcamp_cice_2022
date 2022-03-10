import Foundation
import UIKit

// Input del Router
protocol PodcastRouterInputProtocol {
    
    func showAlert(title: String, message: String)

}

final class PodcastRouter: BaseRouter<PodcastViewController> {
    
}

// Input del Router
extension PodcastRouter: PodcastRouterInputProtocol {
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            self.viewController?.present(Utils.showAlert(title: title, message: message), animated: true, completion: nil)
        }
    }
}
