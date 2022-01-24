@testable import MobileTestMarvel
import XCTest

class TestsHelperTests: TestCase {
    var sut: TestsHelper!
    var storage = [String: String]()

    override func setUp() {
        super.setUp()
        sut = TestsHelper()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testIsTesting() {
        sut.environment[TestHelperConstants.testsConfiguration] = "true"
        XCTAssertTrue(sut.runningUnitTests())

        sut.environment.removeAll()
        XCTAssertFalse(sut.runningUnitTests())
    }
}
