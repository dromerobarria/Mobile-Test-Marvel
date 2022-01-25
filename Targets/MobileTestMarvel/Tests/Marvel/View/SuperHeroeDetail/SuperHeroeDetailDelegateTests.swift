@testable import MobileTestMarvel
import Nimble
import XCTest

class SuperHeroeDetailDelegateTests: TestCase {
    var sut: SuperHeroeDetailDelegate!

    override func setUp() {
        super.setUp()
        sut = SuperHeroeDetailDelegate()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testTableViewHeight() {
        let height = sut.tableView(UITableView(), heightForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(height, UITableView.automaticDimension)
    }
}
