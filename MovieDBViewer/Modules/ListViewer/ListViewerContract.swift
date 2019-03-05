import UIKit

protocol ListViewerWireframeProtocol: class {
    static func assemble(dataSource: MovieDBCloudSourceProtocol, hudProvider: HUDProviderProtocol?) -> UIViewController
}

protocol ListViewerViewProtocol: class {
    var presenter: ListViewerPresenterProtocol? { get set }

    func showMovies(_ movies: [MovieModel])
    func showError(_ error: Error)
    func showLoading()
    func hideLoading()
}

protocol ListViewerInteractorProtocol: class {
    var delegate: ListViewerInteractorDelegate? { get set }

    func fetchMovies(searchType: MovieDBSearchType)
}

protocol ListViewerInteractorDelegate: class {
    func fetchMoviesSuccess(movies: [MovieModel])
    func fetchMoviesFail(error: Error)
}

protocol ListViewerPresenterProtocol: class {
    var view: ListViewerViewProtocol? { get set }
    var interactor: ListViewerInteractorProtocol? { get set }
    var router: ListViewerRouterProtocol? { get set }

    func viewDidLoad()
    func didPressSearchButton(searchType: MovieDBSearchType)
    func didSelectMovie(movie: MovieModel)
}

protocol ListViewerRouterProtocol: class {
    var viewController: UIViewController? { get set }
    func showMovie(movie: MovieModel)
}

enum MovieDBSearchType: String {
    case popular
    case topRated = "top_rated"
}
