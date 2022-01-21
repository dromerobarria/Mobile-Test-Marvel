import UIKit

class EmptyCell: UITableViewCell {
    private let containerView = UIView(frame: .zero)
    private let stackView = UIStackView(frame: .zero)
    private let titleLabel = UILabel(frame: .zero)
    private let messageLabel = UILabel(frame: .zero)
    private let button = UIButton(frame: .zero)
    private var containerInsets = UIEdgeInsets.zero

    private var viewData: EmptyCellViewData?
    private var viewStyle: EmptyCellViewStyle?
    weak var delegate: EmptyCellDelegate?

    // MARK: - Initialization

    func setup(
        viewData: EmptyCellViewData,
        viewStyle: EmptyCellViewStyle = EmptyCellViewStyle()
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
        stackView.spacing = EmptyCellContants.StackView.spacing
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
        button.layer.cornerRadius = EmptyCellContants.Button.cornerRadius
        button.backgroundColor = EmptyCellContants.Button.backgroundColor
        button.titleLabel?.font = EmptyCellContants.Button.font
        button.setTitle(viewData?.buttonTitle, for: .normal)
        button.setTitleColor(EmptyCellContants.Button.tintColor, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: EmptyCellContants.Button.heightAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: EmptyCellContants.Button.widthAnchor).isActive = true

        titleLabel.accessibilityIdentifier = viewStyle?.titleAccessibilityIdentifier
        titleLabel.backgroundColor = .clear
        titleLabel.text = viewData?.title
        titleLabel.textColor = .black
        titleLabel.numberOfLines = EmptyCellContants.Title.numberOfLines
        titleLabel.textAlignment = .center
        titleLabel.font = EmptyCellContants.Title.font
        titleLabel.sizeToFit()
        titleLabel.heightAnchor.constraint(equalToConstant: EmptyCellContants.Title.heightAnchor).isActive = true

        messageLabel.accessibilityIdentifier = viewStyle?.messageAccessibilityIdentifier
        messageLabel.backgroundColor = .clear
        messageLabel.text = viewData?.message
        messageLabel.textColor = EmptyCellContants.Message.textColor
        messageLabel.numberOfLines = EmptyCellContants.Message.numberOfLines
        messageLabel.textAlignment = .center
        messageLabel.font = EmptyCellContants.Message.font
        messageLabel.sizeToFit()
        messageLabel.heightAnchor.constraint(equalToConstant: EmptyCellContants.Message.heightAnchor).isActive = true
    }

    // MARK: - Public

    override func prepareForReuse() {
        super.prepareForReuse()
        delegate = nil
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }

    @objc
    private func didTapButton(sender _: UIButton) {
        delegate?.didTapButton()
    }
}
