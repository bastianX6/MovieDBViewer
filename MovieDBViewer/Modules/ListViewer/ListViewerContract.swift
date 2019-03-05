import UIKit

protocol ListViewerWireframeProtocol: class {
    static func assemble() -> UIViewController
}

protocol ListViewerViewProtocol: class {
    var presenter: ListViewerPresenterProtocol? { get set }
    // viewModel: ViewModel? { get set }

    // Methods to communicate Presenter -> View 
    // func showFoobarsData(_ foobars: [Foobar]) { }
    // func showNoFoobarsScreen() { } 
}

protocol ListViewerInteractorProtocol: class {
    var delegate: ListViewerInteractorDelegate? { get set }

    // Methods to communicate Presenter -> Interactor
    // func fetchFoobar() { }
}

protocol ListViewerInteractorDelegate: class {
    // Methods to communicate Interactor -> Presenter
    // func foobarsFetched(_ foobars: [Foobar]) { }
    // func foobarsFetchedFailed() { }
}

protocol ListViewerPresenterProtocol: class {
    var view: ListViewerViewProtocol? { get set }
    var interactor: ListViewerInteractorProtocol? { get set }
    var router: ListViewerRouterProtocol? { get set }

    // Methods to react and notify from View -> Presenter
    // func viewDidLoad() { }
    // didSelectFoobar(_ foobar: Foobar) { }
}

protocol ListViewerRouterProtocol: class {
    var viewController: UIViewController? { get set }

    // Methods to communicate Presenter -> Router
    //func presentFoobarDetail(forFoobar foobar: Foobar) { }
}
