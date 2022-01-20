import UIKit

class GreetingsDataSource: NSObject {
    weak var viewController: GreetingsViewController?
    var cells: [GreetingsCellType] = GreetingsCellType.default
}

extension GreetingsDataSource: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch cells[indexPath.row] {
        case .title:
            cell = prepareTitleCell(tableView: tableView, indexPath: indexPath)
        case .subtitle:
            cell = prepareSubtitleCell(tableView: tableView, indexPath: indexPath)
        case .message:
            cell = prepareMessageCell(tableView: tableView, indexPath: indexPath)
        case .button:
            cell = prepareButtonCell(tableView: tableView, indexPath: indexPath)
        }
        return cell
    }

    private func prepareTitleCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = String(describing: TitleCell.self)
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TitleCell
        else {
            fatalError("This should never happen")
        }
        var viewData = TitleCellViewData(text: Constants.empty)
        var viewStyle = TitleCellViewStyle()

        switch indexPath.row {
        case 0:
            viewData = TitleCellViewData(text: GreetingsContants.title1)
            viewStyle = TitleCellViewStyle(containerInsets: GreetingsContants.titleInsets)
        default:
            viewData = TitleCellViewData(text: GreetingsContants.title2)
            viewStyle = TitleCellViewStyle(textColor: Theme.current.secondarySolid)
        }

        cell.selectionStyle = .none
        cell.setup(viewData: viewData, viewStyle: viewStyle)
        return cell
    }

    private func prepareSubtitleCell(tableView: UITableView, indexPath _: IndexPath) -> UITableViewCell {
        let cellIdentifier = String(describing: SubTitleCell.self)
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? SubTitleCell
        else {
            fatalError("This should never happen")
        }
        let viewData = SubTitleCellViewData(text: GreetingsContants.subTitle)
        let viewStyle = SubTitleCellViewStyle(font: Font.subtitle1!, containerInsets: GreetingsContants.subTitleInsets)

        cell.selectionStyle = .none
        cell.setup(viewData: viewData, viewStyle: viewStyle)
        return cell
    }

    private func prepareMessageCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = String(describing: MessageCell.self)
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? MessageCell
        else {
            fatalError("This should never happen")
        }
        var viewData = MessageCellViewData(title: "", subTitle: "", image: UIImage())
        var viewStyle = MessageCellViewStyle()
        switch indexPath {
        case GreetingsContants.Messages.firstMessage:
            viewData = MessageCellViewData(title: GreetingsContants.messagesTitles[0],
                                           subTitle: GreetingsContants.messagesSubtitles[0],
                                           image: GreetingsImages.Icons.iconIronMan)
            viewStyle = MessageCellViewStyle(iconBackgroundColor: GreetingsContants.red, containerInsets: GreetingsContants.Messages.insets)
        case GreetingsContants.Messages.secondMessage:
            viewData = MessageCellViewData(title: GreetingsContants.messagesTitles[1],
                                           subTitle: GreetingsContants.messagesSubtitles[1],
                                           image: GreetingsImages.Icons.iconHulk)
            viewStyle = MessageCellViewStyle(iconBackgroundColor: GreetingsContants.yellow, containerInsets: GreetingsContants.Messages.insets)
        case GreetingsContants.Messages.thirdMessage:
            viewData = MessageCellViewData(title: GreetingsContants.messagesTitles[2],
                                           subTitle: GreetingsContants.messagesSubtitles[2],
                                           image: GreetingsImages.Icons.iconAmerica)
            viewStyle = MessageCellViewStyle(iconBackgroundColor: GreetingsContants.green, containerInsets: GreetingsContants.Messages.insets)
        default:
            return cell
        }

        cell.selectionStyle = .none
        cell.setup(viewData: viewData, viewStyle: viewStyle)
        return cell
    }

    private func prepareButtonCell(tableView: UITableView, indexPath _: IndexPath) -> UITableViewCell {
        let cellIdentifier = String(describing: ButtonCell.self)
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ButtonCell
        else {
            fatalError("This should never happen")
        }
        let viewData = ButtonCellViewData(title: GreetingsContants.buttonTitle)
        let viewStyle = ButtonCellViewStyle(titleColor: Theme.current.primaryBackground, containerInsets: GreetingsContants.buttonInsets)

        cell.selectionStyle = .none
        cell.setup(viewData: viewData, viewStyle: viewStyle)
        cell.delegate = viewController
        return cell
    }
}
