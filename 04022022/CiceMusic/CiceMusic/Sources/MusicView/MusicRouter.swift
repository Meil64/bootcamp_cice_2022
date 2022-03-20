import Foundation
import UIKit

// Input del Router
protocol MusicRouterInputProtocol {
    func didSelectRowRouter(data: GenericResult)
    func showAlert(title: String, message: String)
}

final class MusicRouter: BaseRouter<MusicViewController> {
    
}

// Input del Router
extension MusicRouter: MusicRouterInputProtocol {
    func didSelectRowRouter(data: GenericResult) {
        DispatchQueue.main.async {
            let vc = AppleGenericDetailCoordinator.view(dto: AppleGenericDetailCoordinatorDTO(dataModel: data))
            self.viewController?.show(vc, sender: nil)
        }
    }
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            self.viewController?.present(Utils.showAlert(title: title, message: message), animated: true, completion: nil)
        }
    }
}
