@testable import MobileTestMarvel
import XCTest

class LayoutTests: TestCase {
    var view: UIView!
    var superview: UIView!

    override func setUp() {
        super.setUp()
        view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        superview = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }

    override func tearDown() {
        for subview in superview.subviews.reversed() {
            subview.removeFromSuperview()
        }
        view = nil
        superview = nil
        super.tearDown()
    }

    func testPinView() {
        superview.addAutoLayout(subview: view)
        Layout.pin(view: view, to: superview)
        assert(pin: view, superview: superview)
    }

    func testPinViews() {
        let views: [UIView] = [view, view]
        for view in views {
            superview.addAutoLayout(subview: view)
        }
        Layout.pin(views: views, to: superview)
        for view in views {
            assert(pin: view, superview: superview)
        }
    }

    func testCenterViewInSuperview() {
        superview.addAutoLayout(subview: view)
        Layout.center(view: view, in: superview)
        assert(center: view, superview: superview)
    }

    func testCenterViewInSuperviewRelativeWidth() {
        superview.addAutoLayout(subview: view)
        Layout.center(view: view, in: superview, relativeWidth: true)
        assert(center: view, superview: superview, relativeWidth: true)
    }

    func testCenterViewInSuperviewRelativeHeight() {
        superview.addAutoLayout(subview: view)
        Layout.center(view: view, in: superview, relativeHeight: true)
        assert(center: view, superview: superview, relativeHeight: true)
    }

    func testAddConstraintsWithVisualFormat() {
        superview.addAutoLayout(subview: view)
        let formats = ["H:|[view]|", "V:|[view]|"]
        let views: [String: Any] = ["view": view!]
        Layout.addConstraints(withVisualFormats: formats, to: superview, views: views)
        let constraints = superview.constraints
        XCTAssertFalse(constraints.isEmpty)
        for constraint in constraints {
            guard
                let firstItem = constraint.firstItem as? UIView,
                let secondItem = constraint.secondItem as? UIView
            else {
                XCTFail("No second item found")
                return
            }
            if secondItem == superview {
                XCTAssertEqual(firstItem, view)
            } else {
                XCTAssertEqual(firstItem, superview)
            }
        }
    }

    func testPinViewBelowView() {
        superview.addAutoLayout(subview: view)
        let view2 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        superview.addAutoLayout(subview: view2)
        view2.topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        view2.leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        view2.trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        Layout.pin(view: view, below: view2, superview: superview, insets: .zero)

        let constraints = superview.constraints
        XCTAssertFalse(constraints.isEmpty)
        for constraint in constraints {
            guard
                let firstItem = constraint.firstItem as? UIView,
                let secondItem = constraint.secondItem as? UIView
            else {
                XCTFail("No items found")
                return
            }
            if firstItem == view || secondItem == superview,
               secondItem == view || firstItem == superview
            {
                XCTAssertTrue(constraint.firstAttribute == .leading || constraint.firstAttribute == .trailing)
            } else if firstItem == view || secondItem == view2,
                      secondItem == view || firstItem == view2
            {
                XCTAssertTrue(constraint.firstAttribute == .top || constraint.firstAttribute == .top)
            }
        }
    }

    func testPinViewBelowViewWithHeight() {
        superview.addAutoLayout(subview: view)
        let view2 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        superview.addAutoLayout(subview: view2)
        view2.topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        view2.leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        view2.trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        Layout.pin(view: view, below: view2, superview: superview, insets: .zero, height: 50)

        guard let constraint = view.constraints.filter({ $0.firstAttribute == .height }).first else {
            XCTFail("No constraint")
            return
        }
        XCTAssertEqual(constraint.constant, 50)
    }

    private func assert(pin view: UIView, superview: UIView) {
        assert(attributes: [.top, .bottom, .leading, .trailing], view: view, superview: superview)
    }

    private func assert(center view: UIView, superview: UIView, relativeWidth: Bool = false, relativeHeight: Bool = false) {
        assert(attributes: [.centerX, .centerY], view: view, superview: superview)
        if relativeWidth {
            guard let widthConstraint = view.constraints.filter({ $0.firstAttribute == .width }).first else {
                XCTFail("No width constraint")
                return
            }
            let width = superview.frame.width / 2
            XCTAssertEqual(width, widthConstraint.constant)
        } else if relativeHeight {
            guard let heightConstraint = view.constraints.filter({ $0.firstAttribute == .height }).first else {
                XCTFail("No height constraint")
                return
            }
            let height = superview.frame.height / 2
            XCTAssertEqual(height, heightConstraint.constant)
        }
    }

    private func assert(attributes: [NSLayoutConstraint.Attribute], view: UIView, superview: UIView) {
        let constraints = superview.constraints
        XCTAssertFalse(constraints.isEmpty)
        for constraint in constraints {
            guard
                let firstItem = constraint.firstItem as? UIView,
                let secondItem = constraint.secondItem as? UIView
            else {
                XCTFail("No items found")
                return
            }
            for attribute in attributes {
                switch constraint.firstAttribute {
                case attribute:
                    XCTAssertEqual(secondItem, superview)
                    XCTAssertEqual(firstItem, view)
                default:
                    continue
                }
            }
        }
    }
}
