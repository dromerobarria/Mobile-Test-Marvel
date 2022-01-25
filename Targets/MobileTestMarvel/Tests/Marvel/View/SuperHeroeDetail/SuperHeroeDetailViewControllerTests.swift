@testable import MobileTestMarvel
import Nimble
import XCTest

class SuperHeroeDetailViewControllerTests: TestCase {
    var sut: SuperHeroeDetailViewController!

    override func setUp() {
        super.setUp()

        let delegate = SuperHeroeDetailDelegate()
        let dataSource = SuperHeroeDetailDataSource()
        let presenter = SuperHeroeDetailPresenter()
        sut = SuperHeroeDetailViewController(presenter: presenter,
                                             delegate: delegate,
                                             dataSource: dataSource)
    }

    func testInitPresenter() {
        let viewController = ViewFactory.viewController(type: .superHeroeDetail)
        XCTAssertNotNil(viewController)
    }
}
