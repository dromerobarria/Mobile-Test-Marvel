@testable import MobileTestMarvel
import XCTest

class ButtonCellTests: TestCase {
    var sut: ButtonCell!
    var viewData: ButtonCellViewData!
    var viewStyle: ButtonCellViewStyle!
    var delegateMock: ButtonCellDelegateMock!

    override func setUp() {
        super.setUp()
        delegateMock = ButtonCellDelegateMock()
        sut = ButtonCell()
    }

    override func tearDown() {
        delegateMock = nil
        sut = nil
        viewData = nil
        viewStyle = nil
        super.tearDown()
    }

    func testPrepare() {
        viewData = ButtonCellViewData(
            title: "Test title")
        XCTAssertEqual(sut.subviews.count, 0)
        sut.setup(viewData: viewData)
        let containerView = sut.contentView.subviews.first!
        XCTAssertEqual(containerView.subviews.count, 1)
        containerView.subviews.forEach {
            XCTAssertTrue($0 is UIButton)
        }
    }

    func testPrepareForReuse() {
        viewData = ButtonCellViewData(
            title: "Test title")
        sut.setup(viewData: viewData)
        sut.prepareForReuse()
        XCTAssertEqual(sut.subviews.count, 1)
        let containerView = sut.contentView.subviews.first!
        XCTAssertEqual(containerView.subviews.count, 1)
    }

    func testPressButtonShouldCallDelegateDidTap() {
        viewData = ButtonCellViewData(
            title: "Test title")
        sut.setup(viewData: viewData)
        sut.delegate = delegateMock
        let containerView = sut.contentView.subviews.first!
        let button = containerView.subviews.first! as! UIButton
        XCTAssertFalse(delegateMock.tap)
        button.sendActions(for: .touchUpInside)
        XCTAssertTrue(delegateMock.tap)
    }
}
