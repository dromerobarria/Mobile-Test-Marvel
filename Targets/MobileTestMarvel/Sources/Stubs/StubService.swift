import Foundation

class StubService {
    class func stubAll() {
        let productStubs = MarvelStubsService(domainNetwork: MarvelNetwork())
        productStubs.stubAll()
    }
}
