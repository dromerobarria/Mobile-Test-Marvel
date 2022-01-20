import UIKit

struct TitleCellViewStyle {
    let font: UIFont
    let textColor: UIColor
    let contentBackgroundColor: UIColor
    let containerInsets: UIEdgeInsets
    let titleAccessibilityIdentifier: String

    init(
        font: UIFont = TitleCellConstants.Title.font!,
        textColor: UIColor = TitleCellConstants.Title.textColor,
        contentBackgroundColor: UIColor = TitleCellConstants.ContentView.backgroundColor,
        containerInsets: UIEdgeInsets = TitleCellConstants.ContentView.insets,
        titleAccessibilityIdentifier: String = TitleCellConstants.Title.accessibilityIdentifier
    ) {
        self.font = font
        self.textColor = textColor
        self.contentBackgroundColor = contentBackgroundColor
        self.containerInsets = containerInsets
        self.titleAccessibilityIdentifier = titleAccessibilityIdentifier
    }
}
