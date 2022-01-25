@testable import MobileTestMarvel
import Nimble
import XCTest

class DomainNetworkBaseTests: TestCase {
    var sut: DomainNetworkBase<Endpoint.Marvel>!

    override func setUp() {
        super.setUp()
        sut = DomainNetworkBase<Endpoint.Marvel>()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testUrl() {
        #if canImport(Darwin) && (arch(x86_64) || arch(arm64))
            expect { _ = self.sut.url(for: .list) }.to(throwAssertion())
        #endif
    }

    func testParameters() {
        #if canImport(Darwin) && (arch(x86_64) || arch(arm64))
            expect { _ = self.sut.parameters(for: .list, params: nil) }.to(throwAssertion())
        #endif
    }

    func testBaseBFFURL() {
        Environment.all.forEach {
            sut = DomainNetworkBase<Endpoint.Marvel>(environment: $0)
            XCTAssertNotNil(sut.baseBFFURL)
        }
    }
}
