import Foundation
import UIKit

// Input del Router
protocol MusicRouterInputProtocol {
    func didSelectRowRouter(data: GenericResult)
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
}
