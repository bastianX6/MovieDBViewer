final class ListViewerInteractor: ListViewerInteractorProtocol {
    weak var delegate: ListViewerInteractorDelegate?
    private let repository: MovieDBRepositoryProtocol

    init(repository: MovieDBRepositoryProtocol) {
        self.repository = repository
    }

    func fetchMovies(searchType: MovieDBSearchType) {
        repository.getMovieList(searchType: searchType,
                                success: { movies in
                                    self.delegate?.fetchMoviesSuccess(movies: movies)
                                }, failure: { error in
                                    self.delegate?.fetchMoviesFail(error: error)
        })
    }
}
