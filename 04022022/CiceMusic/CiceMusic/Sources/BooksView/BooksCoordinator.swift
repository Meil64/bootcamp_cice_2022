import Foundation

// MARK: - module builder

final class BooksCoordinator {

    static func navigation(dto: BooksCoordinatorDTO? = nil) -> BaseNavigation {
        BaseNavigation(rootViewController: view())
    }
    
    static func view(dto: BooksCoordinatorDTO? = nil) -> BooksViewController & BooksPresenterOutputProtocol {
        let vc = BooksViewController()
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: BooksViewController) -> BooksPresenterInputProtocol & BooksInteractorOutputProtocol {
        let presenter = BooksPresenter(vc: vc)
        presenter.interactor = interactor(presenter: presenter)
        presenter.router = router(vc: vc)
        return presenter
    }
    
    static func interactor(presenter: BooksPresenter) -> BooksInteractorInputProtocol {
        let interactor = BooksInteractor(presenter: presenter)
        return interactor
    }
    
    static func router(vc: BooksViewController) -> BooksRouterInputProtocol {
        let router = BooksRouter(view: vc)
        return router
    }
    
}

struct BooksCoordinatorDTO {
    
}
