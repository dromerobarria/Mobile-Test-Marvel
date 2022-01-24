@testable import MobileTestMarvel
import XCTest

class MessageCellTests: TestCase {
    var sut: MessageCell!
    var viewData: MessageCellViewData!
    var viewStyle: MessageCellViewStyle!

    override func setUp() {
        super.setUp()
        sut = MessageCell()
    }

    override func tearDown() {
        sut = nil
        viewData = nil
        viewStyle = nil
        super.tearDown()
    }

    func testPrepare() {
        viewData = MessageCellViewData(title: "Test title", subTitle: "Test subTitle", image: UIImage())
        XCTAssertEqual(sut.subviews.count, 0)
        sut.setup(viewData: viewData)
        let containerView = sut.contentView.subviews.first!
        XCTAssertEqual(containerView.subviews.count, 0)
        containerView.subviews.forEach {
            XCTAssertTrue($0 is UIStackView)
        }
    }

    func testPrepareForReuse() {
        viewData = MessageCellViewData(title: "Test title", subTitle: "Test subTitle", image: UIImage())
        sut.setup(viewData: viewData)
        sut.prepareForReuse()
        XCTAssertEqual(sut.subviews.count, 1)
    }
}
