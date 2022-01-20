import Foundation
import UIKit
// swiftlint:disable trailing_comma
/// Handles any layout needs
class Layout {
    /// Aligns `topAnchor`, `leadingAnchor`, `trailingAnchor` and `bottomAnchor` of `view` with `superview` anchors
    /// - Parameter view: View to pin
    /// - Parameter to: Superview to pin `view` in
    /// - Parameter insets: Insets to constraint the view within its superview. Default value is .zero
    class func pin(view: UIView, to superview: UIView, insets: UIEdgeInsets = .zero) {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(
                equalTo: superview.topAnchor,
                constant: insets.top
            ),
            view.leadingAnchor.constraint(
                equalTo: superview.leadingAnchor,
                constant: insets.left
            ),
            view.trailingAnchor.constraint(
                equalTo: superview.trailingAnchor,
                constant: -insets.right
            ),
            view.bottomAnchor.constraint(
                equalTo: superview.bottomAnchor,
                constant: -insets.bottom
            ),
        ])
    }

    /// Pins all views to superview
    /// - Parameter views: Views to pin
    /// - Parameter to: Superview to pin `views` in
    /// - Parameter insets: An array with insets for each view. If no inset is found for view, .zero will be used instead
    class func pin(views: [UIView], to superview: UIView, insets: [UIEdgeInsets] = [.zero]) {
        for (index, view) in views.enumerated() {
            let viewInsets = (index < insets.count) ? insets[index] : UIEdgeInsets.zero
            pin(view: view, to: superview, insets: viewInsets)
        }
    }

    /// Centers `view` in `superview`
    /// - Precondition: `view` should have its layout setup properly so height and width are calculated properly
    /// - Parameter view: View to center
    /// - Parameter to: Superview to center `view` in
    /// - Parameter relativeWidth: Whether `view` should have its width calculated relatively to `superview`
    /// - Parameter relativeHeight: Whether `view` should have its height calculated relatively to `superview`
    class func center(view: UIView, in superview: UIView, relativeWidth: Bool = false, relativeHeight: Bool = false) {
        centerYAnchor(of: view, in: superview, relativeHeight: relativeHeight)
        centerXAnchor(of: view, in: superview, relativeWidth: relativeWidth)
    }

    /// Centers `view` X-anchor with `superview` X-anchor
    /// - Precondition: Each view in `views` should have its layout setup properly so height and width are calculated properly
    /// - Parameter view: The view to be centered
    /// - Parameter superview: The view to use as reference to center `view`
    /// - Parameter relativeWidth: Whether `view` should have its width calculated relatively to `superview`
    class func centerXAnchor(of view: UIView, in superview: UIView, relativeWidth: Bool = false) {
        var constraintsToActivate: [NSLayoutConstraint] = [
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
        ]
        if relativeWidth {
            let width = superview.frame.width / 2
            constraintsToActivate += [view.widthAnchor.constraint(equalToConstant: width)]
        }

        NSLayoutConstraint.activate(constraintsToActivate)
    }

    /// Centers `view` Y-anchor with `superview` Y-anchor
    /// - Parameter view: View to center
    /// - Parameter to: Superview to center `view` in
    /// - Parameter relativeHeight: Whether `view` should have its height calculated relatively to `superview`
    class func centerYAnchor(of view: UIView, in superview: UIView, relativeHeight: Bool = false) {
        var constraintsToActivate: [NSLayoutConstraint] = [
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
        ]
        if relativeHeight {
            let height = superview.frame.height / 2
            constraintsToActivate += [view.heightAnchor.constraint(equalToConstant: height)]
        }

        NSLayoutConstraint.activate(constraintsToActivate)
    }

    /// Adds contraints in visual format to `view`
    /// - Parameter formats: A collection of constraint definitions in visual format
    /// - Parameter view: View to add constraints to
    /// - Parameter metrics: A dictionary containing any metrics needed by the constraint
    /// - Parameter views: A dictionary with all views needed by the constraint
    class func addConstraints(withVisualFormats formats: [String], to view: UIView, metrics: [String: Any]? = nil, views: [String: Any]) {
        formats.forEach { format in
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: metrics, views: views))
        }
    }

    /// Pins `view` below `view2` with the given insets as spacing. A height might be provided.
    /// - Parameter view: The view to pin
    /// - Parameter view2: The view to use for the top anchor
    /// - Parameter superview: The view to use for the left and rightanchor
    /// - Parameter insets: The insets for `view`. Top will be used to separate `view` from `view2`
    /// - Parameter height: Optional height for `view`
    class func pin(view: UIView, below view2: UIView, superview: UIView, insets: UIEdgeInsets, height: CGFloat? = nil) {
        var constraintsToActivate: [NSLayoutConstraint] = [
            view.leadingAnchor.constraint(
                equalTo: superview.leadingAnchor,
                constant: insets.left
            ),
            view.topAnchor.constraint(
                equalTo: view2.bottomAnchor,
                constant: insets.top
            ),
            view.trailingAnchor.constraint(
                equalTo: superview.trailingAnchor,
                constant: -insets.right
            ),
        ]

        if let height = height {
            constraintsToActivate += [view.heightAnchor.constraint(equalToConstant: height)]
        }

        NSLayoutConstraint.activate(constraintsToActivate)
    }
}
