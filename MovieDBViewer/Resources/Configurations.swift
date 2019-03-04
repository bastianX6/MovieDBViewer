import Foundation

class Configurations {
    static let shared = Configurations()

    private var properties: [String: Any]? = {
        guard let path = Bundle.main.path(forResource: "Configurations", ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path),
            let propertyDict = try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil) as? [String: Any] else {
            return nil
        }
        return propertyDict
    }()

    var movieDbApiKey: String? {
        guard let properties = self.properties, let apiKey = properties["APIKEY"] as? String else {
            return nil
        }
        return apiKey
    }

    var movieDbEndpoint: String? {
        guard let properties = self.properties, let endpoint = properties["MOVIEDB_ENDPOINT"] as? String else {
            return nil
        }
        return endpoint
    }

    var movieDbImgEndpoint: String? {
        guard let properties = self.properties, let imgEndpoint = properties["MOVIEDB_IMG_ENDPOINT"] as? String else {
            return nil
        }
        return imgEndpoint
    }
}
