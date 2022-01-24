import UIKit

struct SuperHeroesListContants {
    static let title = "SuperHeroes"
    static let titleAmount = "Amount of superheroes"
    static let detailAmount = "Please Select an Option"
    static let amount20 = "20"
    static let amount50 = "50"
    static let amount100 = "100"

    enum TableView {
        static let backgroundColor = Theme.current.primaryLight
        static let accessibilityIdentifier = "MarvelListTable"
    }

    enum SearchBar {
        static let placeholder = "Search"
        static let accessibilityIdentifier = "toolbar"
        static let barTintColor = Theme.current.secondarySolid
        static let borderWidth: CGFloat = 4
    }

    enum Cell {
        enum EmptyCell {
            static let title = "No superheroes yet"
            static let message = "With great power comes great responsibility, Uncle Ben"
            static let button = "Retry"
        }

        enum ErrorCell {
            static let title = "Couldn’t load the superheroes"
            static let message = "The Internet connection appears to be offline."
            static let button = "Retry"
        }
    }

    enum ToolBar {
        static let title = "%@ heroes"
        static let tintColor = Theme.current.secondarySolid
        static let textColor = Theme.current.primaryDark
    }

    enum Alert {
        enum Error {
            static let title = "We are sorry"
            static let message = "Right now, we cant accommodate your request at this time. Try again later."
        }
    }
}
