import UIKit

class SuperHeroesListDataSource: NSObject {
    weak var viewController: SuperHeroesListViewController?

    var heroes: [SuperHeroesViewModel] {
        return viewController?.superHeroesListViewModel ?? []
    }
}

extension SuperHeroesListDataSource: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        guard let viewController = viewController else { return 0 }
        switch viewController.status {
        case .loading:
            return 0
        case .withData:
            return heroes.count
        case .empty, .error, .notResult:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        guard let viewController = viewController else { return cell }
        switch viewController.status {
        case .notResult:
            cell = prepareNoResultCell(tableView: tableView, indexPath: indexPath)
        case .withData:
            cell = prepareSuperHeroeCell(tableView: tableView, indexPath: indexPath)
        case .empty:
            cell = prepareEmptyCell(tableView: tableView, indexPath: indexPath)
        case .error:
            cell = prepareErrorCell(tableView: tableView, indexPath: indexPath)
        case .loading:
            return cell
        }
        return cell
    }

    private func prepareSuperHeroeCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = String(describing: SuperHeroeCell.self)
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? SuperHeroeCell
        else {
            fatalError("This should never happen")
        }
        guard let viewController = viewController else { return cell }

        let viewData = SuperHeroeCellViewData(heroe: heroes[indexPath.row])

        let viewStyle = SuperHeroesCellViewStyle()

        cell.selectionStyle = .none
        cell.setup(viewData: viewData, viewStyle: viewStyle)
        return cell
    }

    private func prepareErrorCell(tableView: UITableView, indexPath _: IndexPath) -> UITableViewCell {
        let cellIdentifier = String(describing: ErrorCell.self)
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ErrorCell
        else {
            fatalError("This should never happen")
        }
        let viewData = ErrorCellViewData(title: SuperHeroesListContants.Cell.ErrorCell.title,
                                         message: SuperHeroesListContants.Cell.ErrorCell.message,
                                         buttonTitle: SuperHeroesListContants.Cell.ErrorCell.button)

        let viewStyle = ErrorCellViewStyle()
        cell.delegate = viewController
        cell.selectionStyle = .none
        cell.setup(viewData: viewData, viewStyle: viewStyle)
        return cell
    }

    private func prepareEmptyCell(tableView: UITableView, indexPath _: IndexPath) -> UITableViewCell {
        let cellIdentifier = String(describing: EmptyCell.self)
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? EmptyCell
        else {
            fatalError("This should never happen")
        }
        let viewData = EmptyCellViewData(title: SuperHeroesListContants.Cell.EmptyCell.title,
                                         message: SuperHeroesListContants.Cell.EmptyCell.message,
                                         buttonTitle: SuperHeroesListContants.Cell.EmptyCell.button)
        let viewStyle = EmptyCellViewStyle()
        cell.delegate = viewController
        cell.selectionStyle = .none
        cell.setup(viewData: viewData, viewStyle: viewStyle)
        return cell
    }

    private func prepareNoResultCell(tableView: UITableView, indexPath _: IndexPath) -> UITableViewCell {
        let cellIdentifier = String(describing: NoResultCell.self)
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? NoResultCell
        else {
            fatalError("This should never happen")
        }
        cell.selectionStyle = .none
        cell.setup()
        return cell
    }
}
