@testable import MobileTestMarvel
import Nimble
import XCTest

class MapperTests: TestCase {
    var sut: Mapper<ErrorModel, ErrorEntity>!

    override func setUp() {
        super.setUp()
        sut = Mapper<ErrorModel, ErrorEntity>()
    }

    func testMapValues() {
        let errorModel = ErrorModel(
            error: "error",
            exception: "exception",
            message: "message",
            path: "path",
            status: 300,
            timestamp: 123_456
        )
        expect { _ = self.sut.map(value: errorModel) }.to(throwAssertion())
        expect { _ = self.sut.map(values: [errorModel]) }.to(throwAssertion())
    }

    func testReverMapValues() {
        let errorEntity = ErrorEntity(
            error: "error",
            exception: "exception",
            message: "message",
            path: "path",
            status: 300,
            timestamp: 123_456
        )
        expect { _ = self.sut.reverseMap(value: errorEntity) }.to(throwAssertion())
        expect { _ = self.sut.reverseMap(values: [errorEntity]) }.to(throwAssertion())
    }
}
