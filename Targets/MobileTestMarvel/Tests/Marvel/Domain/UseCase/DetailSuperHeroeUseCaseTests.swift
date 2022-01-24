@testable import MobileTestMarvel
import XCTest

class DetailSuperHeroeUseCaseTests: TestCase {
    var sut: DetailSuperHeroeUseCase!
    let repositoryMock = SuperHeroesRepositoryMock()

    override func setUp() {
        super.setUp()
        sut = DetailSuperHeroeUseCase(repository: repositoryMock)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testListSuccess() {
        repositoryMock.detailSuccess = true
        sut.detail(id: "1") { result in
            switch result {
            case let .success(list):
                XCTAssertNotNil(list)
                XCTAssertEqual(list.id, 1)
            case .failure:
                XCTAssertThrowsError("should never been called")
            }
        }
    }

    func testListError() {
        repositoryMock.detailSuccess = false
        sut.detail(id: "1") { result in
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
