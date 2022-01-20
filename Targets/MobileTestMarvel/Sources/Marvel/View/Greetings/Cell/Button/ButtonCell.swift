import UIKit

class ButtonCell: UITableViewCell {
    private let containerView = UIView(frame: .zero)
    private let button = UIButton(frame: .zero)
    private var containerInsets = UIEdgeInsets.zero

    private var viewData: ButtonCellViewData?
    private var viewStyle: ButtonCellViewStyle?
    weak var delegate: ButtonCellDelegate?

    // MARK: - Initialization

    func setup(
        viewData: ButtonCellViewData,
        viewStyle: ButtonCellViewStyle = ButtonCellViewStyle()
    ) {
        self.viewData = viewData
        self.viewStyle = viewStyle
        prepare()
    }

    // MARK: - Private

    private func prepare() {
        selectionStyle = .none
        prepareContainerView()
        prepareButton()
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

    private func prepareButton() {
        if button.superview == nil {
            containerView.addAutoLayout(subview: button)
            Layout.pin(
                view: button,
                to: containerView,
                insets: containerInsets
            )
        }
        button.heightAnchor.constraint(equalToConstant: ButtonCellConstants.Button.height).isActive = true
        button.layer.cornerRadius = 8
        button.backgroundColor = ButtonCellConstants.Button.backgroundColor
        button.setTitle(viewData?.title, for: .normal)
        button.setTitleColor(viewStyle?.titleColor, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    // MARK: - Public

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    @objc
    private func didTapButton(sender _: UIButton) {
        delegate?.didTap()
    }
}
