import Alamofire

protocol MovieDBCloudSourceProtocol {
    func getMovieList(apiUrl: String,
                      apiKey: String,
                      searchType: String,
                      success: @escaping (MovieListResponseEntity) -> Void,
                      failure: @escaping (Error) -> Void)
}

class MovieDBCloudSource: MovieDBCloudSourceProtocol {
    func getMovieList(apiUrl: String,
                      apiKey: String,
                      searchType: String,
                      success: @escaping (MovieListResponseEntity) -> Void,
                      failure: @escaping (Error) -> Void) {
        guard let url = URL(string: apiUrl + searchType) else {
            failure(MovieDBCloudSourceError.badURL)
            return
        }
        let parameters: [String: Any] = [
            "api_key": apiKey
        ]
        let request = Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
        request.responseMovieListResponse { response in
            switch response.result {
            case let .success(movieResponse):
                success(movieResponse)
            case let .failure(error):
                failure(error)
            }
        }
    }
}

enum MovieDBCloudSourceError: Error {
    case badURL
}
