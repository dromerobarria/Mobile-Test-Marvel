import Kingfisher
import UIKit
import WebKit

class SuperHeroeDetailCell: UITableViewCell {
    private let stackView = UIStackView(frame: .zero)
    private let containerView = UIView(frame: .zero)
    private let titleLabel = UILabel(frame: .zero)
    private let imageContentView = UIImageView(frame: .zero)
    private let detailLabel = UILabel(frame: .zero)
    private var webView = WKWebView(frame: .zero)
    private var containerInsets = UIEdgeInsets.zero

    private var viewData: SuperHeroeDetailCellViewData?
    private var viewStyle: SuperHeroeDetailCellViewStyle?

    // MARK: - Initialization

    func setup(
        viewData: SuperHeroeDetailCellViewData,
        viewStyle: SuperHeroeDetailCellViewStyle = SuperHeroeDetailCellViewStyle()
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
        ])

        imageContentView.heightAnchor.constraint(equalToConstant: SuperHeroesCellContants.Icon.height).isActive = true
        imageContentView.widthAnchor.constraint(equalToConstant: SuperHeroesCellContants.Icon.width).isActive = true

        containerView.addAutoLayout(subview: detailLabel)
        NSLayoutConstraint.activate([
            detailLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: 0
            ),
            detailLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: 0
            ),
            detailLabel.topAnchor.constraint(
                equalTo: stackView.bottomAnchor,
                constant: 50
            ),
        ])

        containerView.addAutoLayout(subview: webView)
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: 0
            ),
            webView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: 0
            ),
            webView.topAnchor.constraint(
                equalTo: detailLabel.bottomAnchor,
                constant: 50
            ),
            webView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: 0
            ),
        ])

        webView.heightAnchor.constraint(equalToConstant: 500).isActive = true
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

        var resultDescription = ""
        if heroe.resultDescription.isEmpty {
            resultDescription = "There is no description aviable for \(heroe.name)"
        } else {
            resultDescription = heroe.resultDescription
        }

        detailLabel.accessibilityIdentifier = viewStyle?.titleAccessibilityIdentifier
        detailLabel.backgroundColor = .clear
        detailLabel.text = resultDescription
        detailLabel.textColor = SuperHeroesCellContants.TitleLabel.textColor
        detailLabel.numberOfLines = SuperHeroesCellContants.TitleLabel.numberOfLines
        detailLabel.textAlignment = .left
        detailLabel.font = ErrorCellConstants.Title.font
        detailLabel.sizeToFit()

        guard let url = URL(string: heroe.thumbnail.path + ".jpg") else {
            fatalError("Unable to load image heroe")
        }

        imageContentView.kf.setImage(with: url, placeholder: SuperHeroeCellImages.Icons.superHeroeMarvel, options: [.transition(.fade(1))])

        let wiki = heroe.urls.filter { $0.type == .wiki }

        guard let wikiFirst = wiki.first else {
            return
        }

        guard let urlWiki = URL(string: wikiFirst.url) else {
            fatalError("Unable to load wiki heroe")
        }

        webView.load(URLRequest(url: urlWiki))
        webView.allowsBackForwardNavigationGestures = true
    }

    // MARK: - Public

    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
}
