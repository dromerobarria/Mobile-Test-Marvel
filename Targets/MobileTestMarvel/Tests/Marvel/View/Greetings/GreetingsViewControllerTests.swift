@testable import MobileTestMarvel
import Nimble
import XCTest

class GreetingsViewControllerTests: TestCase {
    var sut: GreetingsViewController!

    override func setUp() {
        super.setUp()

        let delegate = GreetingsDelegate()
        let dataSource = GreetingsDataSource()
        sut = GreetingsViewController(delegate: delegate,
                                      dataSource: dataSource)
    }

    func testInitPresenter() {
        let viewController = ViewFactory.viewController(type: .greetings)
        XCTAssertNotNil(viewController)
    }
}
