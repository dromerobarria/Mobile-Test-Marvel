import Foundation

class NetworkServiceLocator {
    private var config: URLSessionConfiguration {
        return URLSessionConfiguration.default
    }

    var session: URLSession {
        return URLSession(configuration: config)
    }
}
