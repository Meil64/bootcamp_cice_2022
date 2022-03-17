import Foundation

final class AppleGenericDetailCoordinator {

    static func navigation(dto: AppleGenericDetailCoordinatorDTO? = nil) -> BaseNavigation {
        BaseNavigation(rootViewController: view(dto: dto))
    }
    
    static func view(dto: AppleGenericDetailCoordinatorDTO? = nil) -> AppleGenericDetailViewController & AppleGenericDetailPresenterOutputProtocol {
        let vc = AppleGenericDetailViewController()
        vc.presenter = presenter(vc: vc, dto: dto)
        return vc
    }
    
    static func presenter(vc: AppleGenericDetailViewController, dto: AppleGenericDetailCoordinatorDTO? = nil) -> AppleGenericDetailPresenterInputProtocol & AppleGenericDetailInteractorOutputProtocol {
        let presenter = AppleGenericDetailPresenter(vc: vc)
        presenter.interactor = interactor(presenter: presenter)
        presenter.router = router(vc: vc)
        presenter.dataModel = dto?.dataModel
        return presenter
    }
    
    static func interactor(presenter: AppleGenericDetailPresenter) -> AppleGenericDetailInteractorInputProtocol {
        let interactor = AppleGenericDetailInteractor(presenter: presenter)
        return interactor
    }
    
    static func router(vc: AppleGenericDetailViewController) -> AppleGenericDetailRouterInputProtocol {
        let router = AppleGenericDetailRouter(view: vc)
        return router
    }
    
}

struct AppleGenericDetailCoordinatorDTO {
    var dataModel: GenericResult?
}
