@testable import MobileTestMarvel
import XCTest

class SuperheroesApiRepositoryTests: TestCase {
    var sut: SuperHeroesApiRepository!
    var dataSourceMock: SuperHeroesDataSourceMock!

    override func setUp() {
        super.setUp()
        dataSourceMock = SuperHeroesDataSourceMock()
        let superHeroeMapper = SuperHeroesModelToEntityMapper()
        sut = SuperHeroesApiRepository(dataSource: dataSourceMock, superHeroesMapper: superHeroeMapper,
                                       errorMapper: ErrorModelToEntityMapper())
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testListSuccess() {
        dataSourceMock.listSuccess = true
        sut.list(amount: "20") { result in
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
        dataSourceMock.listSuccess = false
        sut.list(amount: "20") { result in
            switch result {
            case .success:
                XCTAssertThrowsError("should never been called")
            case let .failure(error):
                XCTAssertEqual(error.status, 400)
                XCTAssertEqual(error.message, "Error unexpected")
            }
        }
    }

    func testDetailSuccess() {
        dataSourceMock.detailSuccess = true
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

    func testIncreaseError() {
        dataSourceMock.detailSuccess = false
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
