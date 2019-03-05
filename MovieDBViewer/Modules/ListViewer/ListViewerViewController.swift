import UIKit

class ListViewerViewController: UIViewController {
    var presenter: ListViewerPresenterProtocol?
    private var movies: [MovieModel] = []
    private var hudProvider: HUDProviderProtocol?

    convenience init(presenter: ListViewerPresenterProtocol, hudProvider: HUDProviderProtocol? = nil) {
        self.init(nibName: "ListViewerViewController", bundle: nil)
        self.presenter = presenter
        self.hudProvider = hudProvider
    }

    // MARK: UIViewController lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // presenter.viewDidLoad()
    }
}

extension ListViewerViewController: ListViewerViewProtocol {
    func showMovies(_ movies: [MovieModel]) {
        self.movies = movies
        // reloadView()
    }

    func showError(_ error: Error) {
        hudProvider?.showError(error.localizedDescription)
    }

    func showLoading() {
        hudProvider?.showLoading()
    }

    func hideLoading() {
        hudProvider?.hideLoading()
    }
}
