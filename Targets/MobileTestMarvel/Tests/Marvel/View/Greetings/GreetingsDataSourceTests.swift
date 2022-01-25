@testable import MobileTestMarvel
import XCTest

class GreetingsDataSourceTests: TestCase {
    var sut: GreetingsDataSource!
    var viewController: GreetingsViewController!

    override func setUp() {
        super.setUp()
        sut = GreetingsDataSource()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testNumber() {
        let tableView = UITableView(frame: .zero)
        XCTAssertEqual(sut.tableView(tableView, numberOfRowsInSection: 0), 7)
    }

    func testCellForRowAt() {
        let tableView = UITableView(frame: .zero)
        let titleCellIdentifier = String(describing: TitleCell.self)
        tableView.register(TitleCell.self, forCellReuseIdentifier: titleCellIdentifier)
        let subTitleCellIdentifier = String(describing: SubTitleCell.self)
        tableView.register(SubTitleCell.self, forCellReuseIdentifier: subTitleCellIdentifier)
        let messageCellIdentifier = String(describing: MessageCell.self)
        tableView.register(MessageCell.self, forCellReuseIdentifier: messageCellIdentifier)
        let buttonCellIdentifier = String(describing: ButtonCell.self)
        tableView.register(ButtonCell.self, forCellReuseIdentifier: buttonCellIdentifier)

        let cell0 = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell0 is TitleCell)
        let cell1 = sut.tableView(tableView, cellForRowAt: IndexPath(row: 1, section: 0))
        XCTAssertTrue(cell1 is TitleCell)
        let cell2 = sut.tableView(tableView, cellForRowAt: IndexPath(row: 2, section: 0))
        XCTAssertTrue(cell2 is SubTitleCell)
        let cell3 = sut.tableView(tableView, cellForRowAt: IndexPath(row: 3, section: 0))
        XCTAssertTrue(cell3 is MessageCell)
        let cell4 = sut.tableView(tableView, cellForRowAt: IndexPath(row: 4, section: 0))
        XCTAssertTrue(cell4 is MessageCell)
        let cell5 = sut.tableView(tableView, cellForRowAt: IndexPath(row: 5, section: 0))
        XCTAssertTrue(cell5 is MessageCell)
        let cell6 = sut.tableView(tableView, cellForRowAt: IndexPath(row: 6, section: 0))
        XCTAssertTrue(cell6 is ButtonCell)
    }
}
