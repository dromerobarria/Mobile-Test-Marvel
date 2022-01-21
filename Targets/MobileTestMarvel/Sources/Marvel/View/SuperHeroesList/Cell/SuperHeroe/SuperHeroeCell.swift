import Kingfisher
import UIKit

class SuperHeroeCell: UITableViewCell {
    private let stackView = UIStackView(frame: .zero)
    private let containerView = UIView(frame: .zero)
    private let titleLabel = UILabel(frame: .zero)
    private let imageContentView = UIImageView(frame: .zero)
    private var containerInsets = UIEdgeInsets.zero

    private var viewData: SuperHeroeCellViewData?
    private var viewStyle: SuperHeroesCellViewStyle?

    // MARK: - Initialization

    func setup(
        viewData: SuperHeroeCellViewData,
        viewStyle: SuperHeroesCellViewStyle = SuperHeroesCellViewStyle()
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
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = SuperHeroesCellContants.StackView.spacing
        stackView.addArrangedSubview(imageContentView)
        stackView.addArrangedSubview(titleLabel)

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
            stackView.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: 0
            ),
            stackView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: 0
            ),
        ])

        imageContentView.heightAnchor.constraint(equalToConstant: SuperHeroesCellContants.Icon.height).isActive = true
        imageContentView.widthAnchor.constraint(equalToConstant: SuperHeroesCellContants.Icon.width).isActive = true
    }

    private func prepareContent() {
        guard let heroe = viewData?.heroe else {
            fatalError("Unable to load heroe")
        }

        titleLabel.accessibilityIdentifier = viewStyle?.titleAccessibilityIdentifier
        titleLabel.backgroundColor = .clear
        titleLabel.text = heroe.name
        titleLabel.textColor = SuperHeroesCellContants.TitleLabel.textColor
        titleLabel.numberOfLines = SuperHeroesCellContants.TitleLabel.numberOfLines
        titleLabel.textAlignment = .center
        titleLabel.font = ErrorCellConstants.Title.font
        titleLabel.sizeToFit()

        guard let url = URL(string: heroe.thumbnail.path + ".jpg") else {
            fatalError("Unable to load image heroe")
        }

        imageContentView.kf.setImage(with: url, placeholder: SuperHeroeCellImages.Icons.superHeroeMarvel, options: [.transition(.fade(1))])
    }

    // MARK: - Public

    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
}
