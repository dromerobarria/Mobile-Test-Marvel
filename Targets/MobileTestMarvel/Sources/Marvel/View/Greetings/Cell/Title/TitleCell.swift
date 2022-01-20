import UIKit

class TitleCell: UITableViewCell {
    private let containerView = UIView(frame: .zero)
    private let titleLabel = UILabel(frame: .zero)
    private var containerInsets = UIEdgeInsets.zero

    private var viewData: TitleCellViewData?
    private var viewStyle: TitleCellViewStyle?

    // MARK: - Initialization

    func setup(
        viewData: TitleCellViewData,
        viewStyle: TitleCellViewStyle = TitleCellViewStyle()
    ) {
        self.viewData = viewData
        self.viewStyle = viewStyle
        prepare()
    }

    // MARK: - Private

    private func prepare() {
        selectionStyle = .none
        prepareContainerView()
        prepareTitle()
    }

    private func prepareContainerView() {
        backgroundColor = viewStyle?.contentBackgroundColor
        containerInsets = viewStyle!.containerInsets
        if containerView.superview == nil {
            contentView.addAutoLayout(subview: containerView)
            Layout.pin(
                view: containerView,
                to: contentView,
                insets: containerInsets
            )
        }
    }

    private func prepareTitle() {
        if titleLabel.superview == nil {
            containerView.addAutoLayout(subview: titleLabel)
            Layout.pin(
                view: titleLabel,
                to: containerView,
                insets: containerInsets
            )
        }

        titleLabel.font = viewStyle?.font
        titleLabel.textColor = viewStyle?.textColor
        titleLabel.accessibilityIdentifier = viewStyle?.titleAccessibilityIdentifier
        titleLabel.text = viewData?.text
    }

    // MARK: - Public

    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
