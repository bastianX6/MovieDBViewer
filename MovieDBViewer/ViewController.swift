import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let dataSource = MovieDBCloudSource()
        if let apiUrl = Configurations.shared.movieDbEndpoint, let apiKey = Configurations.shared.movieDbApiKey {
            dataSource.getMovieList(apiUrl: apiUrl, apiKey: apiKey, searchType: "popular", success: { response in
                print("Response: \(response)")
            }) { error in
                print("Response error: \(error)")
            }
        }
    }
}
