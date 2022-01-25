@testable import MobileTestMarvel
import XCTest

class SuperHeroeDetailDataSourceTests: TestCase {
    var sut: SuperHeroeDetailDataSource!
    var viewController: SuperHeroeDetailViewController!

    override func setUp() {
        super.setUp()
        sut = SuperHeroeDetailDataSource()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testNumber() {
        let tableView = UITableView(frame: .zero)
        XCTAssertEqual(sut.tableView(tableView, numberOfRowsInSection: 0), 1)
    }

    func testCellForRowAt() {
        /*
         let tableView = UITableView(frame: .zero)
         let superHeroeCellIdentifier = String(describing: SuperHeroeDetailCell.self)
         tableView.register(SuperHeroeDetailCell.self, forCellReuseIdentifier: superHeroeCellIdentifier)

         let cell0 = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
         XCTAssertTrue(cell0 is SuperHeroeDetailCell)
         */
    }
}
