import Foundation
import Mimic

class StubService {
    class func stubAll() {
        let productStubs = CountersStubsService(domainNetwork: CounterNetwork())
        productStubs.stubAll()
    }
}
