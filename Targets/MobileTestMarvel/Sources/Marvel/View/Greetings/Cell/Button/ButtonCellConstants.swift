import UIKit

struct ButtonCellConstants {
    enum ContentView {
        static let backgroundColor = Theme.current.primaryBackground
        static let insets = UIEdgeInsets(top: 0, left: 29, bottom: 0, right: 29)
    }

    enum Button {
        static let font = Font.button1
        static let textColor = Theme.current.primarySolid
        static let backgroundColor = Theme.current.secondarySolid
        static let accessibilityIdentifier = "button"
        static let height: CGFloat = 57
    }
}
