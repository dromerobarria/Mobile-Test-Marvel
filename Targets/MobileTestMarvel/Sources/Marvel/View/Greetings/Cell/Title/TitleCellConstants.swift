import UIKit

struct TitleCellConstants {
    enum ContentView {
        static let backgroundColor = Theme.current.primaryBackground
        static let insets = UIEdgeInsets(top: 0, left: 29, bottom: 0, right: 29)
    }

    enum Title {
        static let font = Font.title1
        static let textColor = Theme.current.primarySolid
        static let accessibilityIdentifier = "title_label"
    }
}
