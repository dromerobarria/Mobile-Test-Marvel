import UIKit

struct ErrorCellConstants {
    enum ContentView {
        static let backgroundColor = UIColor.clear
        static let insets = UIEdgeInsets(top: 16, left: 12, bottom: 16, right: 12)
    }

    enum Title {
        static let font = Font.title2
        static let textColor = Theme.current.primarySolid
        static let accessibilityIdentifier = "title_label"
        static let numberOfLines = 1
        static let widthAnchor: CGFloat = 272
        static let heightAnchor: CGFloat = 26
    }

    enum Message {
        static let font = Font.subtitle1
        static let textColor = UIColor(red: 0.533, green: 0.545, blue: 0.565, alpha: 1)
        static let accessibilityIdentifier = "message_label"
        static let numberOfLines = 2
        static let heightAnchor: CGFloat = 55
        static let widthAnchor: CGFloat = 272
    }

    enum Button {
        static let backgroundColor = Theme.current.secondarySolid
        static let tintColor = Theme.current.primaryBackground
        static let accessibilityIdentifier = "button"
        static let widthAnchor: CGFloat = 75
        static let heightAnchor: CGFloat = 35
        static let cornerRadius: CGFloat = 8
    }

    enum StackView {
        static let spacing: CGFloat = 20
    }
}
