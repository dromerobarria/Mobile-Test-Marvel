import UIKit
class SuperHeroeDetailViewController: UIViewController, ActivityIndicatorPresenter {
    private let dataSource: SuperHeroeDetailDataSource
    // swiftlint:disable:next weak_delegate
    private let delegate: SuperHeroeDetailDelegate
    private var presenter: SuperHeroeDetailPresenterProtocol
    var viewModel: SuperHeroesViewModel?

    internal var activityIndicator = UIActivityIndicatorView(style: .large)
    let tableView = UITableView()

    init(
        presenter: SuperHeroeDetailPresenterProtocol,
        delegate: SuperHeroeDetailDelegate,
        dataSource: SuperHeroeDetailDataSource
    ) {
        self.presenter = presenter
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        dataSource.viewController = self
        delegate.viewController = self
        self.presenter.attach(view: self)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        configureSetUpNavigationBar()
        registerCells()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(true, animated: false)
    }

    func configureSetUpNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.hidesBackButton = false
        navigationController?.navigationBar.tintColor = SuperHeroesListContants.ToolBar.tintColor
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            let bar = navigationController?.navigationBar
            bar?.scrollEdgeAppearance = appearance
        }

        title = SuperHeroesListContants.title
    }

    private func prepareTableView() {
        tableView.accessibilityIdentifier = SuperHeroesListContants.TableView.accessibilityIdentifier
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.backgroundColor = SuperHeroesListContants.TableView.backgroundColor
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 70
        tableView.isScrollEnabled = true
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.addAutoLayout(subview: tableView)
        Layout.pin(view: tableView, to: view)
    }

    private func registerCells() {
        let superHeroeCellIdentifier = String(describing: SuperHeroeDetailCell.self)
        tableView.register(SuperHeroeDetailCell.self, forCellReuseIdentifier: superHeroeCellIdentifier)
    }
}

extension SuperHeroeDetailViewController: SuperHeroeDetailViewProtocol {}
