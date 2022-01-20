import UIKit

class ViewFactory {
    class func viewController(type: ViewFactoryType, params _: [String: Any] = [:]) -> UIViewController {
        switch type {
        case .greetings:
            let delegate = GreetingsDelegate()
            let dataSource = GreetingsDataSource()
            return GreetingsViewController(delegate: delegate,
                                           dataSource: dataSource)
        }
    }
}
