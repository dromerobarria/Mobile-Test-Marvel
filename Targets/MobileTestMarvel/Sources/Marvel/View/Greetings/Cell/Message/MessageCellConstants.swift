import UIKit

struct MessageCellConstants {
    enum ContentView {
        static let backgroundColor = Theme.current.primaryBackground
        static let insets = UIEdgeInsets(top: 0, left: 39, bottom: 0, right: 39)
    }

    enum Title {
        static let font = Font.title2
        static let textColor = Theme.current.primarySolid
        static let accessibilityIdentifier = "title_label"
        static let numberOfLines = 2
    }

    enum SubTitle {
        static let font = Font.subtitle1
        static let textColor = Theme.current.primaryMedium
        static let accessibilityIdentifier = "subTitle_label"
        static let numberOfLines = 3
    }

    enum Icon {
        static let backgroundColor = Theme.current.primaryBackground
        static let height: CGFloat = 49
        static let width: CGFloat = 49
        static let cornerRadius: CGFloat = 10
        static let insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    enum StackView {
        static let spacingLabels: CGFloat = 7
        static let spacingIcon: CGFloat = 15
    }
}
