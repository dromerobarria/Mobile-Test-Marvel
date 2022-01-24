@testable import MobileTestMarvel
import XCTest

class ViewAutoLayoutTests: TestCase {
    var sut: UIView!

    override func setUp() {
        super.setUp()
        sut = UIView(frame: .zero)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testAddAutoLayoutSubviews() {
        let views = [UIView(frame: .zero), UIView(frame: .zero), UIView(frame: .zero)]
        sut.addAutoLayout(subviews: views)

        XCTAssertEqual(sut.subviews.count, views.count)
        for subview in sut.subviews {
            XCTAssertFalse(subview.translatesAutoresizingMaskIntoConstraints)
        }
    }

    func testAddAutoLayoutSubview() {
        let view = UIView(frame: .zero)
        sut.addAutoLayout(subview: view)
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
    }

    func testAutolayoutView() {
        let view = UIView.autolayoutView()
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
    }
}
