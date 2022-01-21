import UIKit

struct SuperHeroesCellViewStyle {
    let titleFont: UIFont
    let titleColor: UIColor
    let contentBackgroundColor: UIColor
    let containerInsets: UIEdgeInsets
    let titleAccessibilityIdentifier: String

    init(
        titleFont: UIFont = SuperHeroesCellContants.TitleLabel.font!,
        titleColor: UIColor = SuperHeroesCellContants.TitleLabel.textColor,
        contentBackgroundColor: UIColor = SuperHeroesCellContants.ContentView.backgroundColor,
        containerInsets: UIEdgeInsets = SuperHeroesCellContants.ContentView.insets,
        titleAccessibilityIdentifier: String = SuperHeroesCellContants.TitleLabel.accessibilityIdentifier
    ) {
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.contentBackgroundColor = contentBackgroundColor
        self.containerInsets = containerInsets
        self.titleAccessibilityIdentifier = titleAccessibilityIdentifier
    }
}
