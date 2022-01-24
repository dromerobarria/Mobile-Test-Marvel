import UIKit

struct EmptyCellViewStyle {
    let contentBackgroundColor: UIColor
    let containerInsets: UIEdgeInsets
    let titleAccessibilityIdentifier: String
    let messageAccessibilityIdentifier: String
    let buttonAccessibilityIdentifier: String

    init(
        contentBackgroundColor: UIColor = EmptyCellContants.ContentView.backgroundColor,
        containerInsets: UIEdgeInsets = EmptyCellContants.ContentView.insets,
        titleAccessibilityIdentifier: String = EmptyCellContants.Title.accessibilityIdentifier,
        messageAccessibilityIdentifier: String = EmptyCellContants.Message.accessibilityIdentifier,
        buttonAccessibilityIdentifier: String = EmptyCellContants.Button.accessibilityIdentifier
    ) {
        self.contentBackgroundColor = contentBackgroundColor
        self.containerInsets = containerInsets
        self.titleAccessibilityIdentifier = titleAccessibilityIdentifier
        self.messageAccessibilityIdentifier = messageAccessibilityIdentifier
        self.buttonAccessibilityIdentifier = buttonAccessibilityIdentifier
    }
}
