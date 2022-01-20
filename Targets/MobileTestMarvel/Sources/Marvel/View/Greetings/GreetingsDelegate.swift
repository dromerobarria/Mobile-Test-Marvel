import UIKit

class GreetingsDelegate: NSObject {
    var cells: [GreetingsCellType] = GreetingsCellType.default
}

extension GreetingsDelegate: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch indexPath {
        case GreetingsContants.Messages.firstMessage, GreetingsContants.Messages.secondMessage, GreetingsContants.Messages.thirdMessage:
            cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            UIView.animate(withDuration: 0.6) {
                cell.transform = CGAffineTransform.identity
            }

        default:
            return
        }
    }
}
