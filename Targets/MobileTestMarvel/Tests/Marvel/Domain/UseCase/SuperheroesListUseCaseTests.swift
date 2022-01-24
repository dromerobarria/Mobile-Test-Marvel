@testable import MobileTestMarvel
import XCTest

class SuperHeroesListUseCaseTests: TestCase {
    var sut: SuperHeroesListUseCase!
    let repositoryMock = SuperHeroesRepositoryMock()

    override func setUp() {
        super.setUp()
        sut = SuperHeroesListUseCase(repository: repositoryMock)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testListSuccess() {
        repositoryMock.listSuccess = true
        sut.fetch(amount: "20") { result in
            switch result {
            case let .success(list):
                XCTAssertNotNil(list)
                XCTAssertEqual(list.count, 3)
                XCTAssertEqual(list[0].id, 1)
                XCTAssertEqual(list[1].id, 2)
                XCTAssertEqual(list[2].id, 3)
            case .failure:
                XCTAssertThrowsError("should never been called")
            }
        }
    }

    func testListError() {
        repositoryMock.listSuccess = false
        sut.fetch(amount: "20") { result in
            switch result {
            case .success:
                XCTAssertThrowsError("should never been called")
            case let .failure(error):
                XCTAssertEqual(error.status, 400)
                XCTAssertEqual(error.message, "Error unexpected")
            }
        }
    }
}
