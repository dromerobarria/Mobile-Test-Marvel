import UIKit
class SuperHeroesListViewController: UIViewController, ActivityIndicatorPresenter {
    private let dataSource: SuperHeroesListDataSource
    // swiftlint:disable:next weak_delegate
    private let delegate: SuperHeroesListDelegate
    private var presenter: SuperHeroesListPresenterProtocol
    private let searchController = UISearchController(searchResultsController: nil)
    private var refreshControl = UIRefreshControl()

    internal var activityIndicator = UIActivityIndicatorView(style: .large)
    let tableView = UITableView()
    var status = SuperHeoresListViewStatus.loading

    init(
        presenter: SuperHeroesListPresenterProtocol,
        delegate: SuperHeroesListDelegate,
        dataSource: SuperHeroesListDataSource
    ) {
        status = SuperHeoresListViewStatus.loading
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
        prepareRefresh()
        registerCells()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(false, animated: false)
        configureSetUpNavigationBar()
        prepareSearchController()
    }


    func configureSetUpNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.tintColor = SuperHeroesListContants.ToolBar.tintColor
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            let bar = navigationController?.navigationBar
            bar?.scrollEdgeAppearance = appearance
        }

        title = SuperHeroesListContants.title
    }

    private func prepareSearchController() {
        guard searchController.searchBar.superview == nil else { return }
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.searchTextField.clearButtonMode = .never
        searchController.searchBar.placeholder = SuperHeroesListContants.SearchBar.placeholder
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])
            .setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: SuperHeroesListContants.ToolBar.tintColor],
                for: .normal
            )

        if #available(iOS 11.0, *) {
            searchController.searchBar.clipsToBounds = true
            searchController.searchBar.barTintColor = SuperHeroesListContants.SearchBar.barTintColor
            navigationItem.hidesSearchBarWhenScrolling = false
            navigationItem.searchController = searchController

            guard #available(iOS 13.0, *) else {
                navigationController?.navigationBar.layer.shadowColor = UIColor.clear.cgColor
                return
            }
        } else {
            searchController.searchBar.layer.borderWidth = SuperHeroesListContants.SearchBar.borderWidth
            searchController.searchBar.layer.borderColor = SuperHeroesListContants.SearchBar.barTintColor.cgColor
            searchController.searchBar.barTintColor = SuperHeroesListContants.SearchBar.barTintColor
            tableView.tableHeaderView = searchController.searchBar
        }

        navigationController?.view.setNeedsLayout()
        addAccessibilityIdentifierToSearchBarForTesting(searchController: searchController)
    }

    private func prepareRefresh() {
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: Constants.empty)
        tableView.refreshControl = refreshControl
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

    private func registerCells() {}

    func configureNavigationBar() {}

    func configureToolBar() {}
}

extension SuperHeroesListViewController: SuperHeroesListViewProtocol {}

extension SuperHeroesListViewController {
    private func addAccessibilityIdentifierToSearchBarForTesting(searchController: UISearchController) {
        guard #available(iOS 13.0, *) else {
            // swiftlint:disable:next line_length
            // searchTextField is only available on iOS 13 and up, ignoring the rest if version is lesser// https://developer.apple.com/documentation/uikit/uisearchbar/3175433-searchtextfield
            return
        }
        searchController.searchBar.searchTextField.isAccessibilityElement = true
        searchController.searchBar.searchTextField.accessibilityIdentifier = SuperHeroesListContants.SearchBar.accessibilityIdentifier
    }
}

extension SuperHeroesListViewController: UISearchResultsUpdating {
    func updateSearchResults(for _: UISearchController) {
        if searchController.isActive {}
    }
}

extension SuperHeroesListViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_: UISearchBar) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func searchBarShouldBeginEditing(_: UISearchBar) -> Bool {
        navigationController?.navigationBar.prefersLargeTitles = false
        return true
    }
}
