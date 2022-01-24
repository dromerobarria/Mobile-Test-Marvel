import UIKit
class SuperHeroesListViewController: UIViewController, ActivityIndicatorPresenter {
    private let dataSource: SuperHeroesListDataSource
    // swiftlint:disable:next weak_delegate
    private let delegate: SuperHeroesListDelegate
    private var presenter: SuperHeroesListPresenterProtocol
    private let searchController = UISearchController(searchResultsController: nil)
    private var refreshControl = UIRefreshControl()
    private var viewModel: [SuperHeroesViewModel] = []

    private var changeAmountButton = UIBarButtonItem()
    private var spacerButton = UIBarButtonItem()
    private var totalButton = UIBarButtonItem()
    private var amount: String = SuperHeroesListContants.amount20

    internal var activityIndicator = UIActivityIndicatorView(style: .large)

    let tableView = UITableView()
    var status = SuperHeoresListViewStatus.loading

    init(
        presenter: SuperHeroesListPresenterProtocol,
        delegate: SuperHeroesListDelegate,
        dataSource: SuperHeroesListDataSource
    ) {
        viewModel = []
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

        configureSetUpToolBar()
        configureSetUpNavigationBar()
        prepareSearchController()
        presenter.refreshSuperHeroes(amount: amount)
    }

    func configureSetUpToolBar() {
        var buttonsToolBar = [UIBarButtonItem]()
        navigationController?.toolbar.setItems([], animated: true)
        spacerButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)

        totalButton = UIBarButtonItem(title: SuperHeroesListContants.ToolBar.emptyTitle,
                                      style: .plain,
                                      target: self,
                                      action: nil)

        totalButton.isEnabled = false
        totalButton.tintColor = SuperHeroesListContants.ToolBar.textColor
        changeAmountButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        spacerButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        buttonsToolBar = [spacerButton, totalButton, spacerButton, changeAmountButton]

        navigationController?.toolbar.tintColor = SuperHeroesListContants.ToolBar.tintColor
        navigationController?.toolbar.setItems(buttonsToolBar, animated: true)
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
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = SuperHeroesListContants.SearchBar.placeholder
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.delegate = self
      
    }

    private func prepareRefresh() {
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: Constants.empty)
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
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
        tableView.estimatedRowHeight = SuperHeroesListContants.TableView.estimatedRowHeight
        tableView.isScrollEnabled = true
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.addAutoLayout(subview: tableView)
        Layout.pin(view: tableView, to: view)
    }

    private func registerCells() {
        let superHeroeCellIdentifier = String(describing: SuperHeroeCell.self)
        tableView.register(SuperHeroeCell.self, forCellReuseIdentifier: superHeroeCellIdentifier)
        let emptyCellIdentifier = String(describing: EmptyCell.self)
        tableView.register(EmptyCell.self, forCellReuseIdentifier: emptyCellIdentifier)
        let errorCellIdentifier = String(describing: ErrorCell.self)
        tableView.register(ErrorCell.self, forCellReuseIdentifier: errorCellIdentifier)
        let NoResultCellIdentifier = String(describing: NoResultCell.self)
        tableView.register(NoResultCell.self, forCellReuseIdentifier: NoResultCellIdentifier)
    }

    private func configureToolBar() {
        DispatchQueue.main.async { [self] in
            var buttonsToolBar = [UIBarButtonItem]()
            self.navigationController?.toolbar.setItems([], animated: true)
            self.spacerButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)

            switch self.status {
            case .error, .empty:
                self.totalButton = UIBarButtonItem(title: "",
                                                   style: .plain,
                                                   target: self,
                                                   action: nil)
            default:
                self.totalButton = UIBarButtonItem(title: String(format: SuperHeroesListContants.ToolBar.title,
                                                                 String(viewModel.count)),
                                                   style: .plain,
                                                   target: self,
                                                   action: nil)
            }

            self.totalButton.isEnabled = false
            self.totalButton.tintColor = SuperHeroesListContants.ToolBar.textColor
            self.changeAmountButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(self.editTapped))
            self.spacerButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
            buttonsToolBar = [self.spacerButton, self.totalButton, self.spacerButton, self.changeAmountButton]

            self.navigationController?.toolbar.tintColor = SuperHeroesListContants.ToolBar.tintColor
            self.navigationController?.toolbar.setItems(buttonsToolBar, animated: true)
        }
    }

    @objc
    func refresh() {
        presenter.refreshSuperHeroes(amount: amount)
        searchController.isActive = false
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
        }
    }

    @objc
    private func editTapped(_: UIBarButtonItem) {
        searchController.searchBar.text = ""
        let alert = UIAlertController(title: SuperHeroesListContants.titleAmount, message: SuperHeroesListContants.detailAmount, preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: SuperHeroesListContants.amount20, style: .default, handler: { _ in
            self.amount = SuperHeroesListContants.amount20
            self.presenter.refreshSuperHeroes(amount: self.amount)
        }))

        alert.addAction(UIAlertAction(title: SuperHeroesListContants.amount50, style: .default, handler: { _ in
            self.amount = SuperHeroesListContants.amount50
            self.presenter.refreshSuperHeroes(amount: self.amount)
        }))

        alert.addAction(UIAlertAction(title: SuperHeroesListContants.amount100, style: .default, handler: { _ in
            self.amount = SuperHeroesListContants.amount100
            self.presenter.refreshSuperHeroes(amount: self.amount)
        }))

        alert.popoverPresentationController?.sourceView = view

        present(alert, animated: true)
    }

    func routeToDetail(indexPath: IndexPath) {
        presenter.getSuperHeroesDetail(id: String(viewModel[indexPath.row].id))
    }
}

extension SuperHeroesListViewController: SuperHeroesListViewProtocol {
    func showErrorDetail(message _: String) {
        DispatchQueue.main.async {
            Alerts().showSimpleAlert(
                controller: self,
                title: SuperHeroesListContants.Alert.Error.title,
                message: SuperHeroesListContants.Alert.Error.message
            )
        }
    }

    func showError(message _: String, superHeroes: [SuperHeroesViewModel]) {
        if superHeroes.isEmpty {
            status = SuperHeoresListViewStatus.error
            DispatchQueue.main.async {
                self.tableView.reloadSections(IndexSet(integer: 0), with: .none)
            }
        } else {
            status = SuperHeoresListViewStatus.withData
            DispatchQueue.main.async {
                Alerts().showSimpleAlert(
                    controller: self,
                    title: SuperHeroesListContants.Alert.Error.title,
                    message: SuperHeroesListContants.Alert.Error.message
                )
                self.viewModel = superHeroes
                self.configureToolBar()
                self.tableView.reloadSections(IndexSet(integer: 0), with: .none)
            }
        }
    }

    func showFilter(superHeroes: [SuperHeroesViewModel]) {
        viewModel = superHeroes
        DispatchQueue.main.async {
            if superHeroes.isEmpty {
                self.status = SuperHeoresListViewStatus.notResult
            } else {
                self.status = SuperHeoresListViewStatus.withData
            }
            self.configureToolBar()
            self.tableView.reloadSections(IndexSet(integer: .zero), with: .automatic)
        }
    }

    func showLoading(status: Bool) {
        DispatchQueue.main.async {
            guard status else {
                self.hideActivityIndicator()
                return
            }
            self.showActivityIndicator()
        }
    }

    func show(superHeroes: [SuperHeroesViewModel]) {
        viewModel = superHeroes
        if viewModel.isEmpty {
            status = SuperHeoresListViewStatus.empty
        } else {
            status = SuperHeoresListViewStatus.withData
        }
        configureToolBar()

        DispatchQueue.main.async {
            self.tableView.reloadSections(IndexSet(integer: .zero), with: .none)
        }
    }

    func showDetail(superHeroes: SuperHeroesViewModel) {
        DispatchQueue.main.async {
            let superHeroesVC = ViewFactory.viewController(type: .superHeroeDetail) as! SuperHeroeDetailViewController
            superHeroesVC.view.backgroundColor = Theme.current.primaryBackground
            superHeroesVC.viewModel = superHeroes
            self.navigationController?.pushViewController(superHeroesVC, animated: true)
        }
    }

    var superHeroesListViewModel: [SuperHeroesViewModel] {
        return viewModel
    }
}

extension SuperHeroesListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        presenter.filter(superHeroes: searchBar.text)
    }
}

extension SuperHeroesListViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_: UISearchBar) {
        navigationController?.navigationBar.prefersLargeTitles = true
        presenter.filter(superHeroes: nil)
    }

    func searchBarShouldBeginEditing(_: UISearchBar) -> Bool {
        navigationController?.navigationBar.prefersLargeTitles = false
        return !viewModel.isEmpty
    }
}

extension SuperHeroesListViewController: ErrorCellDelegate {
    func didTap() {
        presenter.refreshSuperHeroes(amount: amount)
    }
}

extension SuperHeroesListViewController: EmptyCellDelegate {
    func didTapButton() {
        presenter.refreshSuperHeroes(amount: amount)
    }
}
