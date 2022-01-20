import UIKit

class MessageCell: UITableViewCell {
    private let containerView = UIView(frame: .zero)
    private let stackView = UIStackView(frame: .zero)
    private let stackViewLabels = UIStackView(frame: .zero)
    private let stackViewIcon = UIStackView(frame: .zero)
    private let titleLabel = UILabel(frame: .zero)
    private let subTitleLabel = UILabel(frame: .zero)
    private let iconView = UIView(frame: .zero)
    private var iconImage = UIImageView(frame: .zero)
    private var containerInsets = UIEdgeInsets.zero
    private var viewData: MessageCellViewData?
    private var viewStyle: MessageCellViewStyle?

    // MARK: - Initialization

    func setup(
        viewData: MessageCellViewData,
        viewStyle: MessageCellViewStyle = MessageCellViewStyle()
    ) {
        self.viewData = viewData
        self.viewStyle = viewStyle
        prepare()
    }

    // MARK: - Private

    private func prepare() {
        selectionStyle = .none
        prepareContainerView()
        prepareStackIcon()
        prepareStackLabels()
        prepareStacks()
        prepareContent()
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

    private func prepareStackIcon() {
        stackViewIcon.axis = .vertical
        stackViewIcon.alignment = .top
        stackViewIcon.distribution = .fill
        stackViewIcon.addArrangedSubview(iconView)
    }

    private func prepareStackLabels() {
        stackViewLabels.axis = .vertical
        stackViewLabels.alignment = .top
        stackViewLabels.distribution = .fill
        stackViewLabels.spacing = MessageCellConstants.StackView.spacingLabels
        stackViewLabels.addArrangedSubview(titleLabel)
        stackViewLabels.addArrangedSubview(subTitleLabel)
    }

    private func prepareStacks() {
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.distribution = .fillProportionally
        stackView.spacing = MessageCellConstants.StackView.spacingIcon
        stackView.addArrangedSubview(stackViewIcon)
        stackView.addArrangedSubview(stackViewLabels)
        contentView.addAutoLayout(subview: stackView)
        Layout.pin(
            view: stackView,
            to: containerView,
            insets: containerInsets
        )
    }

    private func prepareContent() {
        titleLabel.font = viewStyle?.titleFont
        titleLabel.textColor = viewStyle?.titleColor
        titleLabel.accessibilityIdentifier = viewStyle?.titleAccessibilityIdentifier
        titleLabel.text = viewData?.title
        titleLabel.numberOfLines = MessageCellConstants.Title.numberOfLines
        subTitleLabel.font = viewStyle?.subTitleFont
        subTitleLabel.textColor = viewStyle?.subTitleColor
        subTitleLabel.accessibilityIdentifier = viewStyle?.subTitleAccessibilityIdentifier
        subTitleLabel.text = viewData?.subTitle
        subTitleLabel.numberOfLines = MessageCellConstants.SubTitle.numberOfLines

        iconImage.contentMode = .center
        iconImage.image = viewData?.image

        stackViewIcon.heightAnchor.constraint(equalToConstant: MessageCellConstants.Icon.height).isActive = true
        stackViewIcon.widthAnchor.constraint(equalToConstant: MessageCellConstants.Icon.width).isActive = true

        Layout.pin(
            view: iconView,
            to: stackViewIcon,
            insets: MessageCellConstants.Icon.insets
        )

        iconView.layer.cornerRadius = MessageCellConstants.Icon.cornerRadius
        iconView.backgroundColor = viewStyle?.iconBackgroundColor
        iconView.addAutoLayout(subview: iconImage)
        Layout.pin(
            view: iconImage,
            to: iconView,
            insets: MessageCellConstants.Icon.insets
        )
    }

    // MARK: - Public

    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
}
