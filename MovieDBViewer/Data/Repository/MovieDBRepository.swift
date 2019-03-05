import Foundation

protocol MovieDBRepositoryProtocol {
    func getMovieList(searchType: MovieDBRepositorySearchType,
                      success: @escaping ([MovieModel]) -> Void,
                      failure: @escaping (Error) -> Void)
}

class MovieDBRepository: MovieDBRepositoryProtocol {
    private let dataSource: MovieDBCloudSourceProtocol

    init(dataSource: MovieDBCloudSourceProtocol) {
        self.dataSource = dataSource
    }

    func getMovieList(searchType: MovieDBRepositorySearchType,
                      success: @escaping ([MovieModel]) -> Void,
                      failure: @escaping (Error) -> Void) {
        guard let apiKey = Configurations.shared.movieDbApiKey,
            let apiEndpoint = Configurations.shared.movieDbEndpoint else {
            failure(MovieDBRepositoryError.configurationsFail)
            return
        }

        dataSource.getMovieList(apiUrl: apiEndpoint,
                                apiKey: apiKey,
                                searchType: searchType.rawValue,
                                success: { response in
                                    guard let results = response.results else {
                                        failure(MovieDBRepositoryError.nilValue)
                                        return
                                    }
                                    let movies = results.compactMap({ MovieModel(entity: $0) })
                                    success(movies)
                                },
                                failure: failure)
    }
}

enum MovieDBRepositorySearchType: String {
    case popular
    case topRated = "top_rated"
}
