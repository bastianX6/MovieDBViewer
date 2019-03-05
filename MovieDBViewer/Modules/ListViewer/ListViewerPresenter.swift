class ListViewerPresenter: ListViewerPresenterProtocol {
    weak var view: ListViewerViewProtocol?
    var interactor: ListViewerInteractorProtocol?
    var router: ListViewerRouterProtocol?

    convenience init(interactor: ListViewerInteractorProtocol, router: ListViewerRouterProtocol) {
        self.init()
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        view?.showLoading()
        interactor?.fetchMovies(searchType: .popular)
    }

    func didPressSearchButton(searchType: MovieDBSearchType) {
        view?.showLoading()
        interactor?.fetchMovies(searchType: searchType)
    }

    func didSelectMovie(movie: MovieModel) {
        router?.showMovie(movie: movie)
    }
}

extension ListViewerPresenter: ListViewerInteractorDelegate {
    func fetchMoviesSuccess(movies: [MovieModel]) {
        view?.hideLoading()
        view?.showMovies(movies)
    }

    func fetchMoviesFail(error: Error) {
        view?.hideLoading()
        view?.showError(error)
    }
}
