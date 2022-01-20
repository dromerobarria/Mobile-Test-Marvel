import UIKit

class SuperHeroesListDelegate: NSObject {
    weak var viewController: SuperHeroesListViewController?
}

extension SuperHeroesListDelegate: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView(tableView, heightForRowAt: indexPath)
    }
}
