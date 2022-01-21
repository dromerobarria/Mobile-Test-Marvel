import UIKit

class GreetingsViewController: UIViewController {
    private var dataSource: GreetingsDataSource?
    // swiftlint:disable:next weak_delegate
    private var delegate: GreetingsDelegate?
    let tableView = UITableView()

    init(
        delegate: GreetingsDelegate,
        dataSource: GreetingsDataSource
    ) {
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        self.dataSource?.viewController = self
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        navigationController?.setNavigationBarHidden(true, animated: false)
        prepareTableView()
        registerCells()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    private func prepareTableView() {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.backgroundColor = GreetingsContants.TableView.backgroundColor
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.isScrollEnabled = true
        view.addAutoLayout(subview: tableView)
        Layout.pin(view: tableView, to: view)
    }

    private func registerCells() {
        let titleCellIdentifier = String(describing: TitleCell.self)
        tableView.register(TitleCell.self, forCellReuseIdentifier: titleCellIdentifier)
        let subTitleCellIdentifier = String(describing: SubTitleCell.self)
        tableView.register(SubTitleCell.self, forCellReuseIdentifier: subTitleCellIdentifier)
        let messageCellIdentifier = String(describing: MessageCell.self)
        tableView.register(MessageCell.self, forCellReuseIdentifier: messageCellIdentifier)
        let buttonCellIdentifier = String(describing: ButtonCell.self)
        tableView.register(ButtonCell.self, forCellReuseIdentifier: buttonCellIdentifier)
    }
}

extension GreetingsViewController: ButtonCellDelegate {
    func didTap() {
        let countersVC = ViewFactory.viewController(type: .superHeroesList)
        countersVC.view.backgroundColor = Theme.current.primaryBackground
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(countersVC, animated: true)
        }
    }
}

extension GreetingsViewController {
    override func willTransition(to _: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { _ in
            if UIWindow.isLandscape {
                self.tableView.isScrollEnabled = true
            } else {
                self.tableView.isScrollEnabled = false
            }
        })
    }
}
