import Foundation

class NetworkBaseRestApi<T, D>: NetworkRestApi {
    var domainNetwork: DomainNetworkBase<T>
    var session: URLSession
    var codableHelper: CodableHelper

    var network: D {
        // swiftlint:disable:next force_cast
        return domainNetwork as! D
    }

    required init(domainNetwork: DomainNetworkBase<T>, session: URLSession, codableHelper: CodableHelper) {
        self.domainNetwork = domainNetwork
        self.session = session
        self.codableHelper = codableHelper
    }
}
