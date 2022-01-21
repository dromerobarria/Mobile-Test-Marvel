import UIKit

class SuperHeroesListDelegate: NSObject {
    weak var viewController: SuperHeroesListViewController?
}

extension SuperHeroesListDelegate: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        guard let viewController = viewController else { return 0 }

        switch viewController.status {
        case .loading:
            return 0
        case .withData:
            return UITableView.automaticDimension
        case .empty, .error, .notResult:
            // swiftlint:disable:next line_length
            return viewController.view.frame.height - viewController.navigationController!.navigationBar.bounds.height - viewController.navigationController!.toolbar.bounds.height
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        self.tableView(tableView, heightForRowAt: indexPath)
    }
}
