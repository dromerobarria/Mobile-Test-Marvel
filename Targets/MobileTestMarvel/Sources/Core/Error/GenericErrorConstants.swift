import Foundation

enum GenericErrorConstants {
    static let title = "We are sorry"
    static let description = "Right now, we cant accommodate your request at this time. Try again later."
    static let code = 500
}

enum NetworkErrorConstants {
    static let title = "Couldn’t load the superhores"
    static let description = "The Internet connection appears to be offline."
    static let code = -1009
}
