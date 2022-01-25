@testable import MobileTestMarvel
import XCTest

class NoResultCellTests: TestCase {
    var sut: NoResultCell!

    override func setUp() {
        super.setUp()
        sut = NoResultCell()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testPrepare() {
        XCTAssertEqual(sut.subviews.count, 0)
        sut.setup()
        let containerView = sut.contentView.subviews.first!
        XCTAssertEqual(containerView.subviews.count, 1)
        containerView.subviews.forEach {
            XCTAssertTrue($0 is UIStackView)
        }
        let stacksView = containerView.subviews.first!
        XCTAssertTrue(stacksView.subviews.first is UILabel)
    }

    func testPrepareForReuse() {
        sut.setup()
        sut.prepareForReuse()
        XCTAssertEqual(sut.subviews.count, 1)
    }
}
