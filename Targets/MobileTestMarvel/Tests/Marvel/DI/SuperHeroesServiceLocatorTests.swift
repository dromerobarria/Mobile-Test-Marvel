@testable import MobileTestMarvel
import XCTest

class SuperHeroesServiceLocatorTests: TestCase {
    var sut: SuperHeroesServiceLocator!
    override func setUp() {
        super.setUp()
        sut = SuperHeroesServiceLocator()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testBranchServiceLocatorNotNil() {
        XCTAssertNotNil(sut)
    }

    func testBranchServiceLocatorHasUseCaseList() {
        XCTAssertNotNil(sut.superHeroesListUseCase)
    }
}
