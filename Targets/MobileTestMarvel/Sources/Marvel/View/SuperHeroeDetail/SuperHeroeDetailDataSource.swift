import UIKit

class SuperHeroeDetailDataSource: NSObject {
    weak var viewController: SuperHeroeDetailViewController?
}

extension SuperHeroeDetailDataSource: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell = prepareSuperHeroeCell(tableView: tableView, indexPath: indexPath)
        return cell
    }

    private func prepareSuperHeroeCell(tableView: UITableView, indexPath _: IndexPath) -> UITableViewCell {
        guard let viewModel = viewController?.viewModel else {
            return UITableViewCell()
        }

        let cellIdentifier = String(describing: SuperHeroeDetailCell.self)
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? SuperHeroeDetailCell
        else {
            fatalError("This should never happen")
        }
        
        let viewData = SuperHeroeDetailCellViewData(heroe: viewModel)

        let viewStyle = SuperHeroeDetailCellViewStyle()

        cell.selectionStyle = .none
        cell.setup(viewData: viewData, viewStyle: viewStyle)
        return cell
    }
}
