import UIKit

struct MessageCellViewStyle {
    let titleFont: UIFont
    let titleColor: UIColor
    let subTitleFont: UIFont
    let subTitleColor: UIColor
    let iconBackgroundColor: UIColor
    let contentBackgroundColor: UIColor
    let containerInsets: UIEdgeInsets
    let titleAccessibilityIdentifier: String
    let subTitleAccessibilityIdentifier: String

    init(
        titleFont: UIFont = MessageCellConstants.Title.font!,
        subTitleFont: UIFont = MessageCellConstants.SubTitle.font!,
        titleColor: UIColor = MessageCellConstants.Title.textColor,
        subTitleColor: UIColor = MessageCellConstants.SubTitle.textColor,
        iconBackgroundColor: UIColor = MessageCellConstants.Icon.backgroundColor,
        contentBackgroundColor: UIColor = MessageCellConstants.ContentView.backgroundColor,
        containerInsets: UIEdgeInsets = MessageCellConstants.ContentView.insets,
        titleAccessibilityIdentifier: String = MessageCellConstants.Title.accessibilityIdentifier,
        subTitleAccessibilityIdentifier: String = MessageCellConstants.SubTitle.accessibilityIdentifier
    ) {
        self.titleFont = titleFont
        self.subTitleFont = subTitleFont
        self.titleColor = titleColor
        self.subTitleColor = subTitleColor
        self.iconBackgroundColor = iconBackgroundColor
        self.contentBackgroundColor = contentBackgroundColor
        self.containerInsets = containerInsets
        self.titleAccessibilityIdentifier = titleAccessibilityIdentifier
        self.subTitleAccessibilityIdentifier = subTitleAccessibilityIdentifier
    }
}
