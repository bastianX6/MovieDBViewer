import Foundation

enum ListViewerLocalizer: String {
    case emptyViewMessage = "ListViewer.emptyView.message"
    case noAverage = "ListViewer.cell.noAverage"
    case buttonItemTopRated = "ListViewer.barButtonItem.topRated"
    case buttonItemPopular = "ListViewer.barButtonItem.popular"
    case internalError = "ListViewer.error.internal"
}

extension ListViewerLocalizer {
    var localizedString: String {
        return NSLocalizedString(self.rawValue, tableName: "ListViewerLocalizable", comment: "")
    }
}
