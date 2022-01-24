import UIKit

struct ErrorCellViewStyle {
    let contentBackgroundColor: UIColor
    let containerInsets: UIEdgeInsets
    let titleAccessibilityIdentifier: String
    let messageAccessibilityIdentifier: String
    let buttonAccessibilityIdentifier: String

    init(
        contentBackgroundColor: UIColor = ErrorCellConstants.ContentView.backgroundColor,
        containerInsets: UIEdgeInsets = ErrorCellConstants.ContentView.insets,
        titleAccessibilityIdentifier: String = ErrorCellConstants.Title.accessibilityIdentifier,
        messageAccessibilityIdentifier: String = ErrorCellConstants.Message.accessibilityIdentifier,
        buttonAccessibilityIdentifier: String = ErrorCellConstants.Button.accessibilityIdentifier
    ) {
        self.contentBackgroundColor = contentBackgroundColor
        self.containerInsets = containerInsets
        self.titleAccessibilityIdentifier = titleAccessibilityIdentifier
        self.messageAccessibilityIdentifier = messageAccessibilityIdentifier
        self.buttonAccessibilityIdentifier = buttonAccessibilityIdentifier
    }
}
