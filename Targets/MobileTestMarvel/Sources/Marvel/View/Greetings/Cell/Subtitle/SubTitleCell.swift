import UIKit

class SubTitleCell: UITableViewCell {
    private let containerView = UIView(frame: .zero)
    private let titleLabel = UILabel(frame: .zero)
    private var containerInsets = UIEdgeInsets.zero

    private var viewData: SubTitleCellViewData?
    private var viewStyle: SubTitleCellViewStyle?

    // MARK: - Initialization

    func setup(
        viewData: SubTitleCellViewData,
        viewStyle: SubTitleCellViewStyle = SubTitleCellViewStyle()
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
        titleLabel.numberOfLines = viewStyle!.numberOfLines
        titleLabel.textColor = viewStyle?.textColor
        titleLabel.accessibilityIdentifier = viewStyle?.titleAccessibilityIdentifier
        titleLabel.text = viewData?.text
    }

    // MARK: - Public

    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
