import Foundation
import UIKit
import SafariServices

// Input del Router
protocol AppleGenericDetailRouterInputProtocol {
    func showAppleStoreRouter(data: GenericResult)
}

final class AppleGenericDetailRouter: BaseRouter<AppleGenericDetailViewController> {
    
}

// Input del Router
extension AppleGenericDetailRouter: AppleGenericDetailRouterInputProtocol {
    func showAppleStoreRouter(data: GenericResult) {
        DispatchQueue.main.async {
            guard let urlUnw = URL(string: data.url ?? "") else {return}
            let vc = SFSafariViewController(url: urlUnw)
            self.viewController?.present(vc, animated: true, completion: nil)
        }        
    }
}
