import UIKit

class ListViewerViewController: UIViewController {
    var presenter: ListViewerPresenterProtocol?

    convenience init(presenter: ListViewerPresenterProtocol) {
        self.init(nibName: "ListViewerViewController", bundle: nil)
        self.presenter = presenter
    }

    // MARK: UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //presenter.viewDidLoad()
    }
}

extension ListViewerViewController: ListViewerViewProtocol {

}
