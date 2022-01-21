import UIKit

struct NoResultCellConstants {
    enum ContentView {
        static let insets = UIEdgeInsets(top: 16, left: 12, bottom: 0, right: 12)
    }

    static let title = "No results"
    static let numberOfLines = 0
    static let titleAccessibilityIdentifier = "title_label"
    static let font = Font.subtitle3
    static let textColor = UIColor(red: 0.533, green: 0.545, blue: 0.565, alpha: 1)
    static let titleHeight: CGFloat = 26
}
