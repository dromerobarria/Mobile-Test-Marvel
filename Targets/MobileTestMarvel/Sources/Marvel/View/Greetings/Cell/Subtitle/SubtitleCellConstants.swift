import UIKit

struct SubTitleCellConstants {
    enum ContentView {
        static let backgroundColor = Theme.current.primaryBackground
        static let insets = UIEdgeInsets(top: 0, left: 39, bottom: 0, right: 39)
    }

    enum SubTitle {
        static let font = Font.title1
        static let numberOfLines = 2
        static let textColor = Theme.current.primarySolid
        static let accessibilityIdentifier = "subTitle_label"
    }
}
