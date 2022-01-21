import UIKit

class ErrorCell: UITableViewCell {
    private let containerView = UIView(frame: .zero)
    private let stackView = UIStackView(frame: .zero)
    private let titleLabel = UILabel(frame: .zero)
    private let messageLabel = UILabel(frame: .zero)
    private let button = UIButton(frame: .zero)
    private var containerInsets = UIEdgeInsets.zero

    private var viewData: ErrorCellViewData?
    private var viewStyle: ErrorCellViewStyle?
    weak var delegate: ErrorCellDelegate?

    // MARK: - Initialization

    func setup(
        viewData: ErrorCellViewData,
        viewStyle: ErrorCellViewStyle = ErrorCellViewStyle()
    ) {
        self.viewData = viewData
        self.viewStyle = viewStyle
        prepare()
    }

    // MARK: - Private

    private func prepare() {
        selectionStyle = .none
        prepareContainerView()
        prepareStack()
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

    private func prepareStack() {
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = ErrorCellConstants.StackView.spacing
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(messageLabel)
        stackView.addArrangedSubview(button)
        containerView.addAutoLayout(subview: stackView)
        Layout.centerYAnchor(of: stackView, in: containerView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: 0
            ),
            stackView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: 0
            ),
        ])
    }

    private func prepareContent() {
        button.accessibilityIdentifier = viewStyle?.buttonAccessibilityIdentifier
        button.backgroundColor = .clear
        button.layer.cornerRadius = ErrorCellConstants.Button.cornerRadius
        button.backgroundColor = ErrorCellConstants.Button.backgroundColor
        button.setTitle(viewData?.buttonTitle, for: .normal)
        button.setTitleColor(ErrorCellConstants.Button.tintColor, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: ErrorCellConstants.Button.heightAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: ErrorCellConstants.Button.widthAnchor).isActive = true

        titleLabel.accessibilityIdentifier = viewStyle?.titleAccessibilityIdentifier
        titleLabel.backgroundColor = .clear
        titleLabel.text = viewData?.title
        titleLabel.textColor = ErrorCellConstants.Title.textColor
        titleLabel.numberOfLines = ErrorCellConstants.Title.numberOfLines
        titleLabel.textAlignment = .center
        titleLabel.font = ErrorCellConstants.Title.font
        titleLabel.sizeToFit()
        titleLabel.heightAnchor.constraint(equalToConstant: ErrorCellConstants.Title.heightAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: ErrorCellConstants.Title.widthAnchor).isActive = true

        messageLabel.accessibilityIdentifier = viewStyle?.messageAccessibilityIdentifier
        messageLabel.backgroundColor = .clear
        messageLabel.text = viewData?.message
        messageLabel.textColor = ErrorCellConstants.Message.textColor
        messageLabel.numberOfLines = ErrorCellConstants.Message.numberOfLines
        messageLabel.textAlignment = .center
        messageLabel.font = ErrorCellConstants.Message.font
        messageLabel.sizeToFit()
        messageLabel.heightAnchor.constraint(equalToConstant: ErrorCellConstants.Message.heightAnchor).isActive = true
        messageLabel.widthAnchor.constraint(equalToConstant: ErrorCellConstants.Message.widthAnchor).isActive = true
    }

    // MARK: - Public

    override func prepareForReuse() {
        super.prepareForReuse()
        delegate = nil
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }

    @objc
    private func didTapButton(sender _: UIButton) {
        delegate?.didTap()
    }
}
