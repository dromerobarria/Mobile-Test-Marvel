import UIKit

struct SubTitleCellViewStyle {
    let font: UIFont
    let textColor: UIColor
    let numberOfLines: Int
    let contentBackgroundColor: UIColor
    let containerInsets: UIEdgeInsets
    let titleAccessibilityIdentifier: String

    init(
        font: UIFont = SubTitleCellConstants.SubTitle.font!,
        textColor: UIColor = SubTitleCellConstants.SubTitle.textColor,
        numberOfLines: Int = SubTitleCellConstants.SubTitle.numberOfLines,
        contentBackgroundColor: UIColor = SubTitleCellConstants.ContentView.backgroundColor,
        containerInsets: UIEdgeInsets = SubTitleCellConstants.ContentView.insets,
        titleAccessibilityIdentifier: String = SubTitleCellConstants.SubTitle.accessibilityIdentifier
    ) {
        self.font = font
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.contentBackgroundColor = contentBackgroundColor
        self.containerInsets = containerInsets
        self.titleAccessibilityIdentifier = titleAccessibilityIdentifier
    }
}
