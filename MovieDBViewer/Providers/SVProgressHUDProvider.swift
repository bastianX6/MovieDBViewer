import SVProgressHUD

class SVProgressHUDProvider: HUDProviderProtocol {
    func showMessage(_ message: String) {
        SVProgressHUD.showInfo(withStatus: message)
    }

    func showError(_ errorMessage: String) {
        SVProgressHUD.showError(withStatus: errorMessage)
    }

    func showLoading() {
        SVProgressHUD.show()
    }

    func hideLoading() {
        SVProgressHUD.dismiss()
    }
}
