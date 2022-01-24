import UIKit

struct GreetingsContants {
    static let title1 = "Welcome to"
    static let title2 = "Marvel App"
    static let subTitle = "An app that show SuperHeroes from Marvel and more."

    static let buttonTitle = "Continue"
    static let messagesTitles = ["Part of the journey is the end.", "Hulk smash!", "I can do this all day."]
    static let messagesSubtitles = ["Tony Stark, Avengers.",
                                    "Bruce Banner, The Incredible Hulk.",
                                    "Steve Rogers, Captain America: The First Avenger."]

    static let titleInsets = UIEdgeInsets(top: 18, left: 23, bottom: 0, right: 23)
    static let subTitleInsets = UIEdgeInsets(top: 8, left: 23, bottom: 0, right: 23)
    static let buttonInsets = UIScreen.main.bounds.height < 812 ? UIEdgeInsets(top: 24,
                                                                               left: 23,
                                                                               bottom: 24,
                                                                               right: 23) : UIEdgeInsets(top: 44,
                                                                                                         left: 23,
                                                                                                         bottom: 24,
                                                                                                         right: 23)

    enum TableView {
        static let backgroundColor = Theme.current.primaryBackground
    }

    enum Messages {
        static let insets = UIEdgeInsets(top: 20, left: 23, bottom: 0, right: 23)

        static let firstMessage = IndexPath(
            row: 3,
            section: 0
        )
        static let secondMessage = IndexPath(
            row: 4,
            section: 0
        )
        static let thirdMessage = IndexPath(
            row: 5,
            section: 0
        )
    }

    static let yellow = #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1) // UIColor(hex: "#FFCC00")
    static let green = #colorLiteral(red: 0.2980392157, green: 0.8509803922, blue: 0.3921568627, alpha: 1) // UIColor(hex: "#4CD964")
    static let red = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1) // UIColor(hex: "#FF0000")
}
