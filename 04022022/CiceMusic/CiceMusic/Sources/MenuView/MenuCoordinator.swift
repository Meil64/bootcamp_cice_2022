import Foundation

// MARK: - module builder

final class MenuCoordinator {

    static func navigation(dto: MenuCoordinatorDTO? = nil) -> BaseNavigation {
        BaseNavigation(rootViewController: view())
    }
    
    static func view(dto: MenuCoordinatorDTO? = nil) -> MenuViewController & MenuPresenterOutputProtocol {
        let vc = MenuViewController()
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: MenuViewController) -> MenuPresenterInputProtocol & MenuInteractorOutputProtocol {
        let presenter = MenuPresenter(vc: vc)
        presenter.interactor = interactor(presenter: presenter)
        presenter.router = router(vc: vc)
        return presenter
    }
    
    static func interactor(presenter: MenuPresenter) -> MenuInteractorInputProtocol {
        let interactor = MenuInteractor(presenter: presenter)
        return interactor
    }
    
    static func router(vc: MenuViewController) -> MenuRouterInputProtocol {
        let router = MenuRouter(view: vc)
        return router
    }
    
}

struct MenuCoordinatorDTO {
    
}
