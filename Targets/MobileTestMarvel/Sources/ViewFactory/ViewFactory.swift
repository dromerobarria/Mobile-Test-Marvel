import UIKit

class ViewFactory {
    class func viewController(type: ViewFactoryType, params _: [String: Any] = [:]) -> UIViewController {
        let serviceLocator = SuperHeroesServiceLocator()

        switch type {
        case .greetings:
            let delegate = GreetingsDelegate()
            let dataSource = GreetingsDataSource()
            return GreetingsViewController(delegate: delegate,
                                           dataSource: dataSource)
        case .superHeroesList:
            let delegate = SuperHeroesListDelegate()
            let dataSource = SuperHeroesListDataSource()
            let presenter = SuperHeroesListPresenter(superHeroesListUseCase: serviceLocator.superHeroesListUseCase, detailSuperHeroeUseCase: serviceLocator.detailSuperHeroeUseCase, superHeroesViewModelMapper: serviceLocator.superHeroesViewModelMapper)
            return SuperHeroesListViewController(presenter: presenter, delegate: delegate, dataSource: dataSource)
        case .superHeroeDetail:
            let delegate = SuperHeroeDetailDelegate()
            let dataSource = SuperHeroeDetailDataSource()
            let presenter = SuperHeroeDetailPresenter()
            return SuperHeroeDetailViewController(presenter: presenter, delegate: delegate, dataSource: dataSource)
        }
    }
}
