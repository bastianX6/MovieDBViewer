import UIKit

class ListViewerWireframe: ListViewerWireframeProtocol {

    static func assemble() -> UIViewController {
        let interactor = ListViewerInteractor()
        let router = ListViewerRouter()
        let presenter = ListViewerPresenter(interactor: interactor, router: router)
        let view = ListViewerViewController(presenter: presenter)
        // let navigation = UINavigationController(rootViewController: view!)

        interactor.delegate = presenter
        router.viewController = view
        presenter.view = view

        return view //or navigation        
    }
}
