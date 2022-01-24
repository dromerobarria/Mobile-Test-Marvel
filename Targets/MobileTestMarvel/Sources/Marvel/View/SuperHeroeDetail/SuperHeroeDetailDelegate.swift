import UIKit

class SuperHeroeDetailDelegate: NSObject {
    weak var viewController: SuperHeroeDetailViewController?
}

extension SuperHeroeDetailDelegate: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        self.tableView(tableView, heightForRowAt: indexPath)
    }
}
