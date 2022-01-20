import UIKit

struct ButtonCellViewStyle {
    let titleFont: UIFont
    let titleColor: UIColor
    let contentBackgroundColor: UIColor
    let containerInsets: UIEdgeInsets
    let buttonAccessibilityIdentifier: String

    init(
        titleFont: UIFont = MessageCellConstants.Title.font!,
        titleColor: UIColor = MessageCellConstants.Title.textColor,
        contentBackgroundColor: UIColor = MessageCellConstants.ContentView.backgroundColor,
        containerInsets: UIEdgeInsets = MessageCellConstants.ContentView.insets,
        buttonAccessibilityIdentifier: String = MessageCellConstants.Title.accessibilityIdentifier
    ) {
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.contentBackgroundColor = contentBackgroundColor
        self.containerInsets = containerInsets
        self.buttonAccessibilityIdentifier = buttonAccessibilityIdentifier
    }
}
