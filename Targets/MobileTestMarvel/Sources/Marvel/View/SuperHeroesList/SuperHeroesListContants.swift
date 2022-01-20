import UIKit

struct SuperHeroesListContants {
    static let title = "SuperHeroes"

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
            static let button = "Create a counter"
        }

        enum ErrorCell {
            static let title = "Couldn’t load the superheroes"
            static let message = "The Internet connection appears to be offline."
            static let button = "Retry"
        }
    }

    enum ToolBar {
        static let title = "%@ items · Counted %@ times"
        static let selectAll = "Select All"
        static let unselectAll = "Unselect All"
        static let tintColor = Theme.current.secondarySolid
        static let textColor = Theme.current.primaryDark
    }
}
