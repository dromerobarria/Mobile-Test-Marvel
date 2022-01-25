@testable import MobileTestMarvel
import Nimble
import XCTest

class GreetingsDelegateTests: TestCase {
    var sut: GreetingsDelegate!

    override func setUp() {
        super.setUp()
        sut = GreetingsDelegate()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testTableViewHeight() {
        for i in 0 ... (sut.cells.count - 1) {
            let height = sut.tableView(UITableView(), heightForRowAt: IndexPath(row: i, section: 0))
            XCTAssertEqual(height, UITableView.automaticDimension)
        }
    }
}
