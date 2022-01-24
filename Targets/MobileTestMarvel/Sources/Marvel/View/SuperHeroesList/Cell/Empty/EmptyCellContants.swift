import UIKit

struct EmptyCellContants {
    enum ContentView {
        static let backgroundColor = UIColor.clear
        static let insets = UIEdgeInsets(top: 0, left: 36, bottom: 0, right: 36)
    }

    enum Title {
        static let font = Font.title3
        static let textColor = Theme.current.primarySolid
        static let accessibilityIdentifier = "title_label"
        static let numberOfLines = 1
        static let heightAnchor: CGFloat = 26
    }

    enum Message {
        static let font = Font.subtitle1
        static let textColor = UIColor(red: 0.533, green: 0.545, blue: 0.565, alpha: 1)
        static let accessibilityIdentifier = "message_label"
        static let numberOfLines = 3
        static let heightAnchor: CGFloat = 60
    }

    enum Button {
        static let backgroundColor = Theme.current.secondarySolid
        static let tintColor = Theme.current.primaryBackground
        static let accessibilityIdentifier = "button"
        static let widthAnchor: CGFloat = 150
        static let heightAnchor: CGFloat = 35
        static let cornerRadius: CGFloat = 8
        static let font = Font.button1
    }

    enum StackView {
        static let spacing: CGFloat = 20
    }
}
