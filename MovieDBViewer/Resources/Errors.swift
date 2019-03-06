import Foundation

enum MovieDBRepositoryError: Error {
    case configurationsFail, nilValue
}

enum MovieDBCloudSourceError: Error {
    case badURL
}

extension MovieDBRepositoryError {
    var localizedDescription: String {
        let message = ListViewerLocalizer.internalError.localizedString

        switch self {
        case .configurationsFail:
            return message + ": Configuration load fail"
        case .nilValue:
            return message + ": Nil value"
        }
    }
}

extension MovieDBCloudSourceError {
    var localizedDescription: String {
        let message = ListViewerLocalizer.internalError.localizedString

        switch self {
        case .badURL:
            return message + ": Bad url"
        }
    }
}
