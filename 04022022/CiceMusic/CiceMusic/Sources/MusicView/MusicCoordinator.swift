import Foundation

// MARK: - module builder

final class MusicCoordinator {

    static func navigation(dto: MusicCoordinatorDTO? = nil) -> BaseNavigation {
        BaseNavigation(rootViewController: view(dto: dto))
    }
    
    static func view(dto: MusicCoordinatorDTO? = nil) -> MusicViewController & MusicPresenterOutputProtocol {
        let vc = MusicViewController()
        vc.presenter = presenter(vc: vc, dto: dto)
        return vc
    }
    
    static func presenter(vc: MusicViewController, dto: MusicCoordinatorDTO? = nil) -> MusicPresenterInputProtocol & MusicInteractorOutputProtocol {
        let presenter = MusicPresenter(vc: vc)
        presenter.interactor = interactor(presenter: presenter, dto: dto)
        presenter.router = router(vc: vc)
        return presenter
    }
    
    static func interactor(presenter: MusicPresenter, dto: MusicCoordinatorDTO? = nil) -> MusicInteractorInputProtocol {
        let interactor = MusicInteractor(presenter: presenter)
        interactor.data = dto
        return interactor
    }
    
    static func router(vc: MusicViewController) -> MusicRouterInputProtocol {
        let router = MusicRouter(view: vc)
        return router
    }
    
}

struct MusicCoordinatorDTO {
    var model: [ResultMusic]?
}
