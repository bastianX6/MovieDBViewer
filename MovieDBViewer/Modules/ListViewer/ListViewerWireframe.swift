import UIKit

class ListViewerWireframe: ListViewerWireframeProtocol {
    static func assemble(dataSource: MovieDBCloudSourceProtocol = MovieDBCloudSource(), hudProvider: HUDProviderProtocol? = SVProgressHUDProvider()) -> UIViewController {
        let repository = MovieDBRepository(dataSource: dataSource)
        let interactor = ListViewerInteractor(repository: repository)
        let router = ListViewerRouter()
        let presenter = ListViewerPresenter(interactor: interactor, router: router)
        let storyboard = UIStoryboard(name: "ListViewer", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ListViewerViewController") as! ListViewerViewController
        view.setup(presenter: presenter, hudProvider: hudProvider)

        let navigation = UINavigationController(rootViewController: view)

        interactor.delegate = presenter
        router.viewController = view
        presenter.view = view
        router.viewController = view

        return navigation
    }
}
