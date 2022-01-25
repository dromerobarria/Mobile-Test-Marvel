@testable import MobileTestMarvel
import XCTest

class NetworkBaseRestApiTests: TestCase {
    var sut: NetworkBaseRestApi<Endpoint.Marvel, MarvelNetwork>!

    override func setUp() {
        super.setUp()
        sut = NetworkBaseRestApi(domainNetwork: MarvelNetwork(),
                                 session: NetworkServiceLocator().session,
                                 codableHelper: CodableHelper())
    }

    override func tearDown() {
        super.tearDown()
    }

    func testNetwork() {
        XCTAssertNotNil(sut.network)
    }
}
