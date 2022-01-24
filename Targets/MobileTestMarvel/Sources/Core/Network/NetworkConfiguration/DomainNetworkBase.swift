import Foundation

class DomainNetworkBase<T> {
    private let environment: Environment

    init(environment: Environment = EnvironmentHelper.current) {
        self.environment = environment
    }

    var baseBFFURL: String {
        switch environment {
        case .debug:
            return DomainNetworkConstants.ApiHost.debug
        case .release:
            return DomainNetworkConstants.ApiHost.release
        case .stubbed:
            return DomainNetworkConstants.ApiHost.stubbed
        }
    }

    func url(for _: T) -> String {
        fatalError("Must override")
    }

    func parameters(for _: T, params _: Any?) -> [String: Any] {
        fatalError("Must override")
    }
}
