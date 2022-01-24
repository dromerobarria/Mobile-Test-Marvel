@testable import MobileTestMarvel
import XCTest

class CodableHelperTests: TestCase {
    var sut: CodableHelper!

    override func setUp() {
        super.setUp()
        sut = CodableHelper()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testErrorEntity() {
        XCTAssertNotNil(sut.defaultError())
    }
}
