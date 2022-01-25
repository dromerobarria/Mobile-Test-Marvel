import Foundation
import Mimic
import XCTest

class TestCase: XCTestCase {
    let waiter = XCTWaiter()

    override func wait(for expectations: [XCTestExpectation], timeout seconds: TimeInterval) {
        let result = waiter.wait(for: expectations, timeout: seconds)
        let names: [String] = expectations.map { $0.description }
        print("Expectations \(names.joined(separator: ",")) finished with result: \(result.rawValue)")
        if result != XCTWaiter.Result.completed {
            XCTFail(
                """
                Asynchronous wait failed: Exceeded timeout of
                \(seconds) seconds, with unfulfilled expectations:
                \(names) from any object.
                """
            )
        }
    }

    func stub(_ matcher: @escaping MimicRequest, delay: TimeInterval = 0, _ builder: @escaping MimicResponse) -> MimicObject {
        return Mimic.mimic(request: matcher, delay: delay, response: builder)
    }

    func failure(_ error: NSError) -> (_ request: URLRequest) -> MimicResponseType {
        return { (_: URLRequest) in .failure(error) }
    }

    func http(_ status: Int = 200, headers: [String: String]? = nil, download: Any) -> MimicResponse {
        return response(with: download, status: status, headers: headers)
    }

    func json(_ body: Any, status: Int = 200, headers: [String: String]? = nil) -> MimicResponse {
        return response(with: body, status: status, headers: headers)
    }

    func http(_ method: MimicHTTPMethod, uri: String, wildCard: Bool = false) -> MimicRequest {
        return request(with: method, url: uri, wildCard: wildCard)
    }

    override func setUp() {
        super.setUp()
        Mimic.start()
    }

    override func tearDown() {
        Mimic.stopAllMimics()
        super.tearDown()
    }
}
