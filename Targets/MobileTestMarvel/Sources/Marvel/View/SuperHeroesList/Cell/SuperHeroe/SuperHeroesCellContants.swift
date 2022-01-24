import UIKit

struct SuperHeroesCellContants {
    static let imageExtension = ".jpg"

    enum ContentView {
        static let backgroundColor = UIColor.clear
        static let insets = UIEdgeInsets(top: 14, left: 12, bottom: 14, right: 12)
    }

    enum TitleLabel {
        static let font = Font.title2
        static let textColor = Theme.current.primarySolid
        static let accessibilityIdentifier = "title_label"
        static let numberOfLines = 0
    }

    enum StackView {
        static let spacing: CGFloat = 20
    }

    enum Icon {
        static let height: CGFloat = 49
        static let width: CGFloat = 49
    }
}
