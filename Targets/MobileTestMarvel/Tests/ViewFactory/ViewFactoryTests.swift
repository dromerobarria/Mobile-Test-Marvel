@testable import MobileTestMarvel
import Nimble
import XCTest

class ViewFactoryTests: TestCase {
    override func setUp() {
        super.setUp()
    }

    func testViewController() {
        let optionSuperHeroesListViewController: Any? = ViewFactory.viewController(type: .superHeroesList)
        XCTAssertTrue(optionSuperHeroesListViewController is SuperHeroesListViewController)
    }
}
