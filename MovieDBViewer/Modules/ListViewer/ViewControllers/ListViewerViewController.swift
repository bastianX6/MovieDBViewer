import UIKit

class ListViewerViewController: UIViewController {
    var presenter: ListViewerPresenterProtocol?
    internal var movies: [MovieModel] = []
    internal var searchType: MovieDBSearchType = .popular
    private var hudProvider: HUDProviderProtocol?
    @IBOutlet var tableView: UITableView!
    @IBOutlet var barButtonItemPopular: UIBarButtonItem!
    @IBOutlet var barButtonItemTopRated: UIBarButtonItem!

    convenience init(presenter: ListViewerPresenterProtocol, hudProvider: HUDProviderProtocol? = nil) {
        self.init(nibName: ListViewerViewController.nameOfClass, bundle: nil)
        self.presenter = presenter
        self.hudProvider = hudProvider
    }

    // MARK: UIViewController lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
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

    private func setupBarButtonItems() {
        barButtonItemPopular.title = ListViewerLocalizer.buttonItemPopular.localizedString
        barButtonItemTopRated.title = ListViewerLocalizer.buttonItemTopRated.localizedString
    }

    @IBAction func barButtonItemPopularTapped(_: UIBarButtonItem) {
        searchType = .popular
        presenter?.didPressSearchButton(searchType: searchType)
    }

    @IBAction func barButtonItemTopRatedTapped(_: UIBarButtonItem) {
        searchType = .topRated
        presenter?.didPressSearchButton(searchType: searchType)
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
