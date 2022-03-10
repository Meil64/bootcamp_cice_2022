import Foundation

// MARK: - module builder

final class PodcastCoordinator {

    static func navigation(dto: PodcastCoordinatorDTO? = nil) -> BaseNavigation {
        BaseNavigation(rootViewController: view())
    }
    
    static func view(dto: PodcastCoordinatorDTO? = nil) -> PodcastViewController & PodcastPresenterOutputProtocol {
        let vc = PodcastViewController()
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: PodcastViewController) -> PodcastPresenterInputProtocol & PodcastInteractorOutputProtocol {
        let presenter = PodcastPresenter(vc: vc)
        presenter.interactor = interactor(presenter: presenter)
        presenter.router = router(vc: vc)
        return presenter
    }
    
    static func interactor(presenter: PodcastPresenter) -> PodcastInteractorInputProtocol {
        let interactor = PodcastInteractor(presenter: presenter)
        return interactor
    }
    
    static func router(vc: PodcastViewController) -> PodcastRouterInputProtocol {
        let router = PodcastRouter(view: vc)
        return router
    }
    
}

struct PodcastCoordinatorDTO {
    var model: [GenericResult]?
}
