import UIKit

class ViewFactory {
    class func viewController(type: ViewFactoryType, params _: [String: Any] = [:]) -> UIViewController {
        switch type {
        case .greetings:
            let delegate = GreetingsDelegate()
            let dataSource = GreetingsDataSource()
            return GreetingsViewController(delegate: delegate,
                                           dataSource: dataSource)
        case .superHeroesList:
            let delegate = SuperHeroesListDelegate()
            let dataSource = SuperHeroesListDataSource()
            let presenter = SuperHeroesListPresenter()
            return SuperHeroesListViewController(presenter: presenter, delegate: delegate, dataSource: dataSource)
        }
    }
}
