import UIKit

class ListViewerViewController: UIViewController {
    var presenter: ListViewerPresenterProtocol?
    internal var movies: [MovieModel] = []
    internal var searchType: MovieDBSearchType = .popular
    private var hudProvider: HUDProviderProtocol?
    @IBOutlet var tableView: UITableView!
    @IBOutlet var barButtonItemPopular: UIBarButtonItem!
    @IBOutlet var barButtonItemTopRated: UIBarButtonItem!

    // MARK: UIViewController lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupTableView()
        setupBarButtonItems()
        presenter?.viewDidLoad()
    }

    private func setupTableView() {
        let view = UIView()
        view.backgroundColor = .white
        tableView.tableFooterView = view
        tableView.register(ListViewerCell.nib, forCellReuseIdentifier: ListViewerCell.reusableIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.emptyDataSetSource = self
    }

    func setup(presenter: ListViewerPresenterProtocol, hudProvider: HUDProviderProtocol? = nil) {
        self.presenter = presenter
        self.hudProvider = hudProvider
    }

    private func setupBarButtonItems() {
        barButtonItemPopular.title = ListViewerLocalizer.buttonItemPopular.localizedString
        barButtonItemTopRated.title = ListViewerLocalizer.buttonItemTopRated.localizedString
    }

    private func setupTitle() {
        title = ListViewerLocalizer.title.localizedString
    }

    @IBAction func barButtonItemPopularTapped(_: UIBarButtonItem) {
        searchType = .popular
        presenter?.didPressSearchButton(searchType: searchType)
    }

    @IBAction func barButtonItemTopRatedTapped(_: UIBarButtonItem) {
        searchType = .topRated
        presenter?.didPressSearchButton(searchType: searchType)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movie = sender as? MovieModel,
            let destinationVC = segue.destination as? MovieDetailViewController,
            segue.identifier == "ListViewerDetailSegue" {
            destinationVC.movie = movie
            destinationVC.modalPresentationStyle = UIModalPresentationStyle.popover
            destinationVC.popoverPresentationController?.delegate = self
        }
    }
}

extension ListViewerViewController: ListViewerViewProtocol {
    func showMovies(_ movies: [MovieModel]) {
        self.movies = movies
        tableView?.reloadData()
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

extension ListViewerViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for _: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
