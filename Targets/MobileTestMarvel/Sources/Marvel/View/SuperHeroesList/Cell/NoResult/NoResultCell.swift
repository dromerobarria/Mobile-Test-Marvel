import UIKit

class NoResultCell: UITableViewCell {
    private let containerView = UIView(frame: .zero)
    private let stackView = UIStackView(frame: .zero)
    private let titleLabel = UILabel(frame: .zero)
    private var containerInsets = UIEdgeInsets.zero

    // MARK: - Initialization

    func setup() {
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
        backgroundColor = .clear
        containerInsets = NoResultCellConstants.ContentView.insets
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
        stackView.spacing = 0
        stackView.addArrangedSubview(titleLabel)
        containerView.addAutoLayout(subview: stackView)
        Layout.center(view: stackView, in: containerView)
    }

    private func prepareContent() {
        titleLabel.backgroundColor = .clear
        titleLabel.text = NoResultCellConstants.title
        titleLabel.textColor = NoResultCellConstants.textColor
        titleLabel.numberOfLines = NoResultCellConstants.numberOfLines
        titleLabel.textAlignment = .center
        titleLabel.font = NoResultCellConstants.font
        titleLabel.accessibilityIdentifier = NoResultCellConstants.titleAccessibilityIdentifier
        titleLabel.sizeToFit()
        titleLabel.heightAnchor.constraint(equalToConstant: NoResultCellConstants.titleHeight).isActive = true
    }

    // MARK: - Public

    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
}
