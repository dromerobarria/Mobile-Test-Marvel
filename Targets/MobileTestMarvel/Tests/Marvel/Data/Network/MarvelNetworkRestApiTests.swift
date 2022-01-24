import Mimic
@testable import MobileTestMarvel
import XCTest

class MarvelNetworkRestApiTests: TestCase {
    var sut: MarvelNetworkRestApi!

    override func setUp() {
        super.setUp()
        sut = MarvelNetworkRestApi(domainNetwork: MarvelNetwork(),
                                   session: NetworkServiceLocator().session,
                                   codableHelper: CodableHelper())
    }

    override func tearDown() {
        super.tearDown()
    }
/*
    func testListSuccess() {
        let body = readJSONArray(fileName: "GET_superHeroesList_200")
        let url = String(format: MarvelNetwork().url(for: .list))

        _ = stub(http(.get, uri: url), json(body, status: 200))
        let exp = expectation(description: #function)

        sut.list(amount: "20") { result in
            switch result {
            case let .success(list):
                XCTAssertNotNil(list)
                XCTAssertEqual(list.count, 3)
                exp.fulfill()
            case .failure:
                XCTAssertThrowsError("should never been called")
            }
        }
        wait(for: [exp], timeout: 10)
    }
*/
    func testListFailure() {
        let body = readJSON(fileName: "GET_superHeroes_400")
        let url = String(format: MarvelNetwork().url(for: .list))

        _ = stub(http(.get, uri: url), json(body, status: 400))
        let exp = expectation(description: #function)

        sut.list(amount: "20") { result in
            switch result {
            case .success:
                XCTAssertThrowsError("should never been called")
            case let .failure(error):
                XCTAssertNotNil(error.status)
                XCTAssertNotNil(error.message)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 10)
    }

    /*
     func testDetailSuccess() {
         let body = readJSONArray(fileName: "GET_superHeroeDetail_200")
         let url = String(format: MarvelNetwork().url(for: .detail))

         _ = stub(http(.post, uri: url), json(body, status: 200))
         let exp = expectation(description: #function)

         sut.detail(id: "1") { result in
             switch result {
             case let .success(list):
                 XCTAssertNotNil(list)
                 XCTAssertEqual(list.id, 1)
                 exp.fulfill()
             case .failure:
                 XCTAssertThrowsError("should never been called")
             }
         }
         wait(for: [exp], timeout: 10)
     }
     */
    func testIncreaseFailure() {
        let body = readJSON(fileName: "GET_superHeroeDetail_400")
        let url = String(format: MarvelNetwork().url(for: .detail))

        _ = stub(http(.post, uri: url), json(body, status: 400))
        let exp = expectation(description: #function)

        sut.detail(id: "1") { result in
            switch result {
            case .success:
                XCTAssertThrowsError("should never been called")
            case let .failure(error):
                XCTAssertNotNil(error.status)
                XCTAssertNotNil(error.message)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 10)
    }
}
