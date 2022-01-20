import UIKit

class SuperHeroesListDataSource: NSObject {
    weak var viewController: SuperHeroesListViewController?
}

extension SuperHeroesListDataSource: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 0
    }

    func tableView(_: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        return cell
    }
}
