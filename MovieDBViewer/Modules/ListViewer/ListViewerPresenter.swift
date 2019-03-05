class ListViewerPresenter: ListViewerPresenterProtocol {
    var view: ListViewerViewProtocol?
    var interactor: ListViewerInteractorProtocol?
    var router: ListViewerRouterProtocol?

    convenience init(interactor: ListViewerInteractorProtocol, router: ListViewerRouterProtocol) {
        self.init()
        self.interactor = interactor
        self.router = router
    }
}

extension ListViewerPresenter: ListViewerInteractorDelegate {

}
