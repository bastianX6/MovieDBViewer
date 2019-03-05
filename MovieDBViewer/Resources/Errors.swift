import Foundation

enum MovieDBRepositoryError: Error {
    case configurationsFail, nilValue
}

enum MovieDBCloudSourceError: Error {
    case badURL
}
