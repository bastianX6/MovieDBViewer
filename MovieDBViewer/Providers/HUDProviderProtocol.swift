import Foundation

protocol HUDProviderProtocol {
    func showMessage(_ message: String)
    func showError(_ errorMessage: String)
    func showLoading()
    func hideLoading()
}
