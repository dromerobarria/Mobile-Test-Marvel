import Mimic
@testable import MobileTestMarvel
import XCTest

class StubServiceTests: TestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testStubAll() {
        //StubService.stubAll()
        //assertSuperHeroesStubsService()
    }

    private func assertSuperHeroesStubsService() {
        let network = MarvelNetwork(environment: .stubbed)

        var request = URLRequest(url: URL(string: network.url(for: .list))!)
        request.httpMethod = MimicHTTPMethod.get.description
        XCTAssertTrue(MimicProtocol.canInit(with: request))
    }
}
