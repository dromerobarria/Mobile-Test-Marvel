import UIKit

extension UIView {
    /// Returns a view ready for auto-layout
    /// - Returns: A view with red background and `translatesAutoresizingMaskIntoConstraints = false`
    class func autolayoutView() -> UIView {
        let view = UIView()
        view.backgroundColor = Theme.current.primaryBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    /// Adds `subview` as a child of `self`
    /// - Parameter subview: A view to be added as a subview
    func addAutoLayout(subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
    }

    /// Adds `subviews` as a child of `self`
    /// - Parameter subviews: A collection of views to be added as subviews
    func addAutoLayout(subviews: [UIView]) {
        subviews.forEach { addAutoLayout(subview: $0) }
    }
}

extension UIWindow {
    static var isLandscape: Bool {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows
                .first?
                .windowScene?
                .interfaceOrientation
                .isLandscape ?? false
        } else {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
}
