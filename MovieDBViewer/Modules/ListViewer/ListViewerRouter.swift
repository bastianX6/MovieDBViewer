import UIKit

class ListViewerRouter: ListViewerRouterProtocol {
    weak var viewController: UIViewController?

    func showMovie(movie: MovieModel) {
        viewController?.performSegue(withIdentifier: "ListViewerDetailSegue", sender: movie)
    }
}
