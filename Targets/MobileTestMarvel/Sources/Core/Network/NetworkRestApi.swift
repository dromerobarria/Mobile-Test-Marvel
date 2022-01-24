import Foundation

protocol NetworkRestApi {
    // swiftlint:disable:next type_name
    associatedtype T
    var domainNetwork: DomainNetworkBase<T> { get set }
    var session: URLSession { get set }
    var codableHelper: CodableHelper { get set }

    init(domainNetwork: DomainNetworkBase<T>, session: URLSession, codableHelper: CodableHelper)
}
