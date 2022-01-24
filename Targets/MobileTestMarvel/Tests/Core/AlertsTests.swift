@testable import MobileTestMarvel
import XCTest

class AlertTests: TestCase {
    var sut: Alerts!

    override func setUp() {
        super.setUp()
        sut = Alerts()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testAlerts() {
        sut.showSimpleAlert(controller: UIViewController(), title: "title", message: "message")
    }
}
