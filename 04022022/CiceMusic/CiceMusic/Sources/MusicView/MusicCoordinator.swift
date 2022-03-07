import Foundation

// MARK: - module builder

final class MusicCoordinator {

    static func navigation(dto: MusicCoordinatorDTO? = nil) -> BaseNavigation {
        BaseNavigation(rootViewController: view())
    }
    
    static func view(dto: MusicCoordinatorDTO? = nil) -> MusicViewController & MusicPresenterOutputProtocol {
        let vc = MusicViewController()
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: MusicViewController) -> MusicPresenterInputProtocol & MusicInteractorOutputProtocol {
        let presenter = MusicPresenter(vc: vc)
        presenter.interactor = interactor(presenter: presenter)
        presenter.router = router(vc: vc)
        return presenter
    }
    
    static func interactor(presenter: MusicPresenter) -> MusicInteractorInputProtocol {
        let interactor = MusicInteractor(presenter: presenter)
        return interactor
    }
    
    static func router(vc: MusicViewController) -> MusicRouterInputProtocol {
        let router = MusicRouter(view: vc)
        return router
    }
    
}

struct MusicCoordinatorDTO {
    
}
