import Foundation
import UIKit

// Input del Router
protocol BooksRouterInputProtocol {

    func showAlert(title: String, message: String)
    
}

final class BooksRouter: BaseRouter<BooksViewController> {
    
}

// Input del Router
extension BooksRouter: BooksRouterInputProtocol {
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            self.viewController?.present(Utils.showAlert(title: title, message: message), animated: true, completion: nil)
        }
    }
}
