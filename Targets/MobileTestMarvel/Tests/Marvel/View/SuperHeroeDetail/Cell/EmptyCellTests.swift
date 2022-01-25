@testable import MobileTestMarvel
import XCTest

class EmptyCellTests: TestCase {
    var sut: EmptyCell!
    var viewData: EmptyCellViewData!
    var viewStyle: EmptyCellViewStyle!
    var delegateMock: EmptyCellDelegateMock!

    override func setUp() {
        super.setUp()
        delegateMock = EmptyCellDelegateMock()
        sut = EmptyCell()
    }

    override func tearDown() {
        delegateMock = nil
        sut = nil
        viewData = nil
        viewStyle = nil
        super.tearDown()
    }

    func testPrepare() {
        XCTAssertEqual(sut.subviews.count, 0)
        let viewData = EmptyCellViewData(title: "title", message: "message", buttonTitle: "Button title")
        sut.setup(viewData: viewData)
        let containerView = sut.contentView.subviews.first!
        XCTAssertEqual(containerView.subviews.count, 1)
        containerView.subviews.forEach {
            XCTAssertTrue($0 is UIStackView)
        }
        let stacksView = containerView.subviews.first!
        XCTAssertTrue(stacksView.subviews.first is UILabel)
        XCTAssertTrue(stacksView.subviews[1] is UILabel)
        XCTAssertTrue(stacksView.subviews[2] is UIButton)
    }

    func testPrepareForReuse() {
        let viewData = EmptyCellViewData(title: "title", message: "message", buttonTitle: "Button title")
        sut.setup(viewData: viewData)
        sut.prepareForReuse()
        XCTAssertEqual(sut.subviews.count, 1)
    }

    func testRetryShouldCallDelegate() {
        let viewData = EmptyCellViewData(title: "title", message: "message", buttonTitle: "Button title")
        sut.setup(viewData: viewData)
        sut.delegate = delegateMock
        let containerView = sut.contentView.subviews.first!
        XCTAssertEqual(containerView.subviews.count, 1)
        containerView.subviews.forEach {
            XCTAssertTrue($0 is UIStackView)
        }
        let stacksView = containerView.subviews.first!
        let button = stacksView.subviews[2] as! UIButton
        XCTAssertFalse(delegateMock.tap)
        button.sendActions(for: .touchUpInside)
        XCTAssertTrue(delegateMock.tap)
    }
}
